import express from "express"
import { orderController } from "../controllers/order.controller"
const orderRouter = express.Router()

orderRouter.get("/orderAll", orderController.orderAll);
orderRouter.post("/order", orderController.order);

export default orderRouter