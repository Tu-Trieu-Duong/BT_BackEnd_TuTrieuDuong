import { BadrequestException } from "../common/helpers/exception.helper";
import { models } from "../common/init/init.sequelize";

export const orderService = {
  orderAll: async () => {
    const orderAll = await models.orders.findAll();
    return orderAll;
  },
  order: async ({ user_id, food_id, amount, arr_sub_id }) => {
    if (!user_id || !food_id || !amount) {
      throw new BadrequestException(
        "Kiểm tra lại user_id, food_id, amount"
      );
    }
    const checkUser = await models.users.findByPk(user_id);
    if (!checkUser) {
      throw new BadrequestException("Người dùng không tồn tại");
    }
    const checkFood = await models.food.findByPk(food_id);
    if (!checkFood) {
      throw new BadrequestException("Món ăn không có trong thực đơn");
    }
    if (arr_sub_id && Array.isArray(arr_sub_id)) {
      for (const sub_id of arr_sub_id) {
        const checkSub = await models.sub_food.findByPk(sub_id);
        if (!checkSub) {
          throw new BadrequestException(
            `Sub food có id ${sub_id} không tồn tại`
          );
        }
      }
    }
    

    const order = await models.orders.create({
      user_id,
      food_id,
      amount,
      arr_sub_id: arr_sub_id ? JSON.stringify(arr_sub_id) : null,
    });

    // Tự tạo code theo id
    order.code = `ORD${String(order.id).padStart(2, "0")}`;
    await order.save();
    return order;
  },
};
