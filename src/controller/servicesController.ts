import { Request, Response } from "express";
import { getConnection, getRepository } from "typeorm";
import { Producer } from "../entity/Producer";
import { Lease } from "../entity/Lease";
import verifyToken from "./verifyToken";
import { Account } from "../entity/Account";
import { Product } from "../entity/Product";
import * as moment from 'moment';

const listProducer = async (req: Request, res: Response) => {
    const producerRepository = getRepository(Producer);
    let list = await producerRepository.find();
    res.status(200).json(list);
}
const addLease = async (req: Request, res: Response) => {
    const leaseRepository = getRepository(Lease);
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const user = await getRepository(Account).findOne({
        where: {
            username: req.body.username
        }
    });
    const product = await getRepository(Product).findOne(req.body.productId);
    let lease = leaseRepository.create({
        startTime: req.body.dateStart,
        endTime: req.body.dateEnd,
        account: user,
        product,
    });
    await leaseRepository.save(lease);
    res.status(200).json({...lease});
}

const getListLease = async (req: Request, res: Response) => {
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const user = await getRepository(Account).findOne({
        where: {
            username: req.body.username
        },
        relations: ["leases", "leases.product", "leases.product.events"]
    });
    user.leases.forEach(lease => {
        const { events } = lease.product
        lease.product.events = events.filter(event => {
            return moment(event.endTime).isSameOrAfter(moment()) && moment(event.startTime).isSameOrBefore(moment())
        })
    })
    res.status(200).json(user.leases);
}

export {
    listProducer,
    addLease,
    getListLease
}