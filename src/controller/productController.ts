import { Request, Response } from "express";
import verifyToken from "./verifyToken";
import { getRepository, MoreThan } from "typeorm";
import { Product } from "../entity/Product";
import * as fs from "fs";
import { Category } from "../entity/Category";
import { Producer } from "../entity/Producer";
import { Account } from "../entity/Account";
import * as moment from 'moment';

const addProduct = async (req: Request, res: Response) => {
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const reqUser = await getRepository(Account).findOne({
        where: {
            username: req.body.username
        }
    });
    if (reqUser.role < 1) throw new Error('Bạn không có quyền truy cập!');
    const productRepository = getRepository(Product);
    let newProduct = productRepository.create({
        name: req.body.name,
        description: req.body.description,
        cost: req.body.cost,
        producer: req.body.producer,
        category: req.body.category,
        image: ((req.files instanceof Array && req.files.length > 0) ? (req.files[0].filename) : 'default.jpg')
    });
    await productRepository.save(newProduct);
    const product = await productRepository.findOne({
        where: {
            id: newProduct.id
        },
        relations: ['category', 'producer']
    })
    res.status(200).json(product);
}
const editProduct = async (req: Request, res: Response) => {
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const reqUser = await getRepository(Account).findOne({
        where: {
            username: req.body.username
        }
    });
    if (reqUser.role < 1) throw new Error('Bạn không có quyền truy cập!');
    const productRepository = getRepository(Product);
    const categoryRepository = getRepository(Category);
    const producerRepository = getRepository(Producer);
    let product = await productRepository.findOne({
        where: {
            id: req.body.id
        },
        relations: ["category", "producer"]
    });
    let category = await categoryRepository.findOne({
        where: {
            id: req.body.idCategory
        }
    });
    let producer = await producerRepository.findOne({
        where: {
            id: req.body.idProducer
        }
    });
    product.category = category;
    product.producer = producer;
    product.name = req.body.name;
    product.cost = req.body.cost;
    product.description = req.body.description;
    if (req.files instanceof Array && req.files.length > 0) {
        product.image = req.files[0].filename;
    }
    try {
        await productRepository.save(product);
    } catch (error) {
        throw error;
    }
    res.status(200).json(product);
}
const listProduct = async (req: Request, res: Response) => {
    const productRepository = getRepository(Product);
    let list = await productRepository.find({
        relations: ['category', 'producer', 'events']
    });
    list.forEach(product => {
        const listEvent = product.events
        product.events = listEvent.filter(event => {
            return moment(event.endTime).isSameOrAfter(moment()) && moment(event.startTime).isSameOrBefore(moment())
        })
    })
    res.status(200).json(list);
}

const deleteProduct = async (req: Request, res: Response) => {
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const reqUser = await getRepository(Account).findOne({
        where: {
            username: req.body.username
        }
    });
    if (reqUser.role < 1) throw new Error('Bạn không có quyền truy cập!');
    const productRepository = getRepository(Product);
    const product = await productRepository.findOne(req.body.id);
    try {
        if (product.image !== 'default.jpg') fs.unlinkSync('./src/asset/image/' + product.image);
        await productRepository.remove(product);
    } catch (error) {
        throw error;
    }
    res.status(200).json({ message: 'success' });
}
const getProduct = async (req: Request, res: Response) => {
    const productRepository = getRepository(Product);
    const product = await productRepository.findOneOrFail({
        where: {
            id: req.body.id
        },
        relations: ["category", "producer", "leases", "events"]
    });
    const listEvent = product.events
    product.events = listEvent.filter(event => {
        return moment(event.endTime).isSameOrAfter(moment()) && moment(event.startTime).isSameOrBefore(moment())
    })
    res.status(200).json(product);
}

export {
    addProduct,
    listProduct,
    deleteProduct,
    editProduct,
    getProduct
}

