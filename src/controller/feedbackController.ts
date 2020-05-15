import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { Feedback } from "../entity/Feedback";
import verifyToken from "./verifyToken";
import { Account } from "../entity/Account";

const addFeedback = async (req: Request, res: Response) => {
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const feedbackRepository = getRepository(Feedback);
    const userRepository = getRepository(Account);
    const user = await userRepository.findOne({
        username: req.body.username
    });
    const newFeedback = feedbackRepository.create({
        account: user,
        content: req.body.content
    });
    await feedbackRepository.save(newFeedback);
    res.status(200).json({ message: 'success' });
}
const listFeedback = async (req: Request, res: Response) => {
    if (!(await verifyToken(req.body.username, req.headers.token)))
        throw new Error('Sai token!');
    const reqUser = await getRepository(Account).findOne({
        where: {
            username: req.body.username
        }
    });
    if (reqUser.role < 1) throw new Error('Bạn không có quyền truy cập!');
    const feedbackRepository = getRepository(Feedback);
    let list = await feedbackRepository.find({
        relations: ["account", "account.profile"],
    });
    const newList = list.map(feedback => ({
        content: feedback.content,
        account: {
            name: feedback.account.profile.name,
            username: feedback.account.username
        }
    }));
    res.status(200).json(newList);
}

export {
    addFeedback,
    listFeedback
}