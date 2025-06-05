import express from "express";
import likeRouter from "./like.router";
import rateRouter from "./rate.router";
import orderRouter from "./order.router";

const rootRouter = express.Router();
rootRouter.use("/like", likeRouter)
rootRouter.use("/rate", rateRouter);
rootRouter.use("/order", orderRouter);

export default rootRouter