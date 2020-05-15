import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { Account } from "../entity/Account";
import verifyToken from "./verifyToken";
import * as fs from "fs";
import { Profile } from "../entity/Profile";

const listUser = async (req: Request, res: Response) => {
    const userRepository = getRepository(Account);
    if (!(await verifyToken(req.body.username ,req.headers.token))) throw new Error("Sai token!");
    const requestUser = await userRepository.findOne({
        where: {username: req.body.username}
    });
    if (requestUser.role === 0) throw new Error("Bạn không có quyền truy cập!");
    const listUser = await userRepository.find({
        where: {role: 0},
        relations: ["profile"],
        select: ["id", "profile"]
    });
    res.status(200).json(listUser);
}

const deleteUser = async (req: Request, res: Response) => {
    const userRepository = getRepository(Account);
    const profileRepository = getRepository(Profile);
    if (!(await verifyToken(req.body.username ,req.headers.token))) throw new Error("Sai token!");
    const requestUser = await userRepository.findOne({
        where: {username: req.body.username}
    });
    if (requestUser.role === 0) throw new Error("Bạn không có quyền truy cập!");
    try {
        let userRemove = await userRepository.remove(await userRepository.findOne({
            where: {id: req.body.id},
            relations: ["profile"]
        }));
        //console.log(userRemove);
        let profileRemove = userRemove.profile;
        if (profileRemove.avatar !== 'default.png') fs.unlinkSync('./src/asset/avatar/' + profileRemove.avatar);
        //console.log(profileRemove);
        await profileRepository.delete(profileRemove.id);
    } catch (error) {
        //console.log(error.message);
        throw error;
    }
    res.status(200).json({message: 'success'});
}

const editUser = async (req: Request, res: Response) => {
    //console.log(req.body);
    const userRepository = getRepository(Account);
    const profileRepository = getRepository(Profile);
    if (!(await verifyToken(req.body.username ,req.headers.token))) throw new Error("Sai token!");
    const requestUser = await userRepository.findOne({
        where: {username: req.body.username}
    });
    if (requestUser.role === 0) throw new Error("Bạn không có quyền truy cập!");
    let user = await userRepository.findOne({
        where: { id: req.body.id },
        relations: ["profile"]
    });
    let profile = user.profile;
    Object.keys(req.body).forEach(key => {
        if (key !=='avatar' && key!=='username' && key!=='id') {
            profile[key] = req.body[key];
        }
    });
    if (req.files instanceof Array && req.files.length > 0) {
        if (profile.avatar !== 'default.png')
            fs.unlinkSync('./src/asset/avatar/' + profile.avatar);
        profile.avatar = req.files[0].filename;
    }
    try {
        profileRepository.save(profile);
    } catch (error) {
        throw error;
    }
    delete user.password;
    delete user.role;
    delete user.token;
    delete user.username;
    res.status(201).json({ user });
}

export {
    listUser,
    deleteUser,
    editUser
}