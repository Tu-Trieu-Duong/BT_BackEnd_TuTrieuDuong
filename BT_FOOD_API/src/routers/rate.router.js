import express from 'express';
import { rateController } from '../controllers/rate.controller';

const rateRouter = express.Router();

rateRouter.get("/rateAll", rateController.rateAll);
rateRouter.post("/rate", rateController.rate);
rateRouter.get("/rateRes/:res_id", rateController.rateRes);
rateRouter.get("/rateUser/:user_id", rateController.rateUser);



export default rateRouter;