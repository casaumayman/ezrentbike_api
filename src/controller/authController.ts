import { Response, Request } from "express";
import { getRepository } from "typeorm";
import * as jwt from 'jsonwebtoken';
import { secretKey } from "../constants/secretKey";
import { Profile } from "../entity/Profile";
import { Account } from "../entity/Account";
import * as fs from 'fs';
import verifyToken from "./verifyToken";

const login = async (req: Request, res: Response) => {
    const userRepository = getRepository(Account);
    let result = await userRepository.findOne({
        where: { username: req.body.username, password: req.body.password },
        relations: ["profile", "leases"]
    });
    //console.log(result);

    if (!result) {
        throw new Error('Sai tên đăng nhập hoặc mật khẩu!');
    } else {
        const user = {
            name: result.profile.name,
            username: result.username,
            role: result.role,
            phoneNumber: result.profile.phoneNumber,
            email: result.profile.email,
            avatar: result.profile.avatar,
            address: result.profile.address,
            cardLength: result.leases.filter(lease => Number(lease.endTime) > + new Date()).length
        }
        //console.log(user);
        const token = jwt.sign(user, secretKey);
        await userRepository.update({ username: user.username }, { token: token });
        res.status(200).json({ token: token });
    }
}

const register = async (req: Request, res: Response) => {
    const userRepository = getRepository(Account);
    const profileRepository = getRepository(Profile);
    const username = req.body.username;
    let result = await userRepository.find({ username: username });
    if (result.length > 0) {
        throw new Error('Tên tài khoản đã tồn tại!');
    }
    else {
        let newProfile = profileRepository.create({
            name: req.body.name,
            email: req.body.email,
            phoneNumber: req.body.phoneNumber,
            address: req.body.address,
            avatar: ((req['files'] instanceof Array && req['files'].length > 0) ? (req['files'][0].filename) : 'default.png')
        });
        await profileRepository.save(newProfile);
        let newUser = userRepository.create({
            username: username,
            password: req.body.password,
            role: 0,
            token: null,
            profile: newProfile
        });
        await userRepository.save(newUser);
        res.status(201).json({ message: 'success' });
    }
}

const editUser = async (req: Request, res: Response) => {
    const userRepository = getRepository(Account);
    const profileRepository = getRepository(Profile);
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const username = req.body.username;
    let user = await userRepository.findOne({
        where: { username: username },
        relations: ["profile", "leases"]
    });
    let profile = user.profile;
    Object.keys(req.body).forEach(key => {
        if (key !== 'username') {
            profile[key] = req.body[key];
        }
    });
    if (req['files'] instanceof Array && req['files'].length > 0) {
        if (profile.avatar !== 'default.png')
            try {
                fs.unlinkSync('./src/asset/avatar/' + profile.avatar);
            } catch (ex) {
                console.log(ex)
            }
        profile.avatar = req['files'][0].filename;
    }
    try {
        profileRepository.save(profile);
    } catch (error) {
        throw error;
    }
    const newUser = {
        name: profile.name,
        username: username,
        role: user.role,
        phoneNumber: profile.phoneNumber,
        email: profile.email,
        avatar: profile.avatar,
        address: profile.address,
        cardLength: user.leases.filter(lease => Number(lease.endTime) > + new Date()).length
    }
    const newToken = jwt.sign(newUser, secretKey);
    user.token = newToken;
    await userRepository.save(user);
    res.status(201).json({ avatar: profile.avatar, token: newToken });
}

const changePassword = async (req: Request, res: Response) => {
    const accountRepository = getRepository(Account);
    let {username, oldPass, newPass} = req.body;
    const user = await accountRepository.findOne({
        where: {
            username: username,
            password: oldPass
        }
    });
    if (!user) throw new Error('Mật khẩu cũ không chính xác!');
    user.password = newPass;
    await accountRepository.save(user);
    res.status(200).json({});
}

export {
    login,
    register,
    editUser,
    changePassword
}