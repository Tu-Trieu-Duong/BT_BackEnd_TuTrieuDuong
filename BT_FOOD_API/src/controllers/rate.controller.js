import { responseSuccess } from "../common/helpers/response.helper";
import { rateService } from "../services/rate.service";

export const rateController = {
  rateAll: async (req, res, next) => {
    try {
      const result = await rateService.rateAll(req);
      const response = responseSuccess(result, `Gọi API rateAll thành công!`);
      res.status(response.statusCode).json(response);
    } catch (err) {
      next(err);
    }
  },
  rate: async (req, res, next) => {
    try {
      const { user_id, res_id, amount } = req.body;
      const result = await rateService.rate(user_id, res_id, amount);
      const response = responseSuccess(result, `Gọi API rate thành công!`);
      res.status(response.statusCode).json(response);
    } catch (err) {
      next(err);
    }
  },
  rateRes: async (req, res, next) => {
    try {
      const { res_id } = req.params
      const result = await rateService.rateRes(res_id);
      const response = responseSuccess(result, `Gọi API rateRes thành công!`);
      res.status(response.statusCode).json(response);
    } catch (err) {
      next(err);
    }
  },
  rateUser: async (req, res, next) => {
    try {
      const { user_id } = req.params
      const result = await rateService.rateUser(user_id);
      const response = responseSuccess(result, `Gọi API rateUser thành công!`);
      res.status(response.statusCode).json(response);
    } catch (err) {
      next(err);
    }
  },
};