import { responseSuccess } from "../common/helpers/response.helper";
import { orderService } from "../services/order.service";

export const orderController = {
  orderAll: async (req, res, next) => {
    try {
      const result = await orderService.orderAll(req);
      const response = responseSuccess(result, `Gọi API orderAll thành công`);
      res.status(response.statusCode).json(response);
    } catch (err) {
      next(err);
    }
  },
  order: async (req,res,next) => {
    try {
      const params = req.body
      const result = await orderService.order(params);
      const response = responseSuccess(result, `Gọi API order thành công`);
      res.status(response.statusCode).json(response);
    } catch (err) {
      next(err);
    }
  }
};