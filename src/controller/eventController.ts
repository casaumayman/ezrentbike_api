import { Event } from "./../entity/Event";
import { Response } from "express";
import { Request } from "express";
import { getConnection, getRepository, MoreThanOrEqual, Raw } from "typeorm";
import verifyToken from "./verifyToken";
import CreateEventDTO from "../dto/CreateEventDto";

const createEvent = async (req: Request, res: Response) => {
  const requestBody: CreateEventDTO = req.body;
  if (!(await verifyToken(requestBody.username, req.headers.token)))
    throw new Error("Sai token!");
  if ((requestBody.event?.products?.length ?? 0) === 0) {
    throw new Error("Phải có sản phẩm áp dụng!");
  }
  const { event: {value, isPercent} = { value: 0, isPercent: true } } = requestBody
  if (
      (value < 1) ||
      (isPercent && (value > 100))
    ) {
    throw new Error("Giá trị khuyến mãi không hợp lệ!");
  }
  const repository = getRepository(Event);
  const newEvent = repository.create(requestBody.event);
  await repository.save(newEvent);
  res.status(200).json({ message: "success" });
};

const getListEvent = async (req: Request, res: Response) => {
  const repository = getRepository(Event);
  const listEvent = await repository.find({
    where: {
      endTime: Raw((endTime) => `${endTime} >= NOW()`),
    },
    relations: ["products"],
    order: {
        id: 'DESC'
    }
  });
  res.status(200).json(listEvent);
};

export { createEvent, getListEvent };
