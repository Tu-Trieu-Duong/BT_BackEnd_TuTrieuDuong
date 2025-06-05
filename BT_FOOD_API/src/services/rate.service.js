import { BadrequestException } from "../common/helpers/exception.helper"
import { models } from "../common/init/init.sequelize"

export const rateService = {
  rateAll: async () => {
    const rateAll = await models.rate_res.findAll();
    return rateAll;
  },
  rate: async (user_id, res_id, amount) => {
    if (!user_id || !res_id || !amount) {
      throw new BadrequestException("Kiểm tra lại user_id, res_id, amount");
    }
    const checkUser = await models.users.findByPk(user_id);
    if (!checkUser) {
      throw new BadrequestException("Người dùng không tồn tại");
    }
    const checkRes = await models.restaurant.findByPk(res_id);
    if (!checkRes) {
      throw new BadrequestException("Nhà hàng không tồn tại");
    }
    if (amount < 1 || amount > 5) {
      throw new BadrequestException(
        "Vui lòng đánh giá trong khoảng từ 1 đến 5"
      );
    }
    const postRate = await models.rate_res.create({
      user_id,
      res_id,
      amount,
      date_rate: new Date(),
    });
    return postRate;
  },
  rateRes: async (res_id) => {
    if (!res_id) {
      throw new BadrequestException("Không có thông tin nhà hàng");
    }
    const checkRes = await models.restaurant.findByPk(res_id);
    if (!checkRes) {
      throw new BadrequestException("Nhà hàng không tồn tại");
    }
    const rateRes = await models.rate_res.findAll({
      where: { res_id, isActive: true },
    });
    return rateRes;
  },
  rateUser: async (user_id) => {
    if (!user_id) {
      throw new BadrequestException("Không có thông tin người dùng");
    }
    const checkUser = await models.users.findByPk(user_id);
    if (!checkUser) {
      throw new BadrequestException("Người dùng không tồn tại");
    }
    const rateUser = await models.rate_res.findAll({
      where: { user_id, isActive: true },
    });
    return rateUser;
  },
};