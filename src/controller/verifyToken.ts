import { getRepository } from "typeorm";
import { Account } from "../entity/Account";

const verifyToken = async (username, token) => {
    if (!username || !token) return false;
    const accoutRepository = getRepository(Account);
    const user = await accoutRepository.findOne({
        username: username
    });
    //console.log((user.token === token));
    return ((user.token === token));
}

export default verifyToken;