import { BadrequestException } from "../common/helpers/exception.helper";
import { models } from "../common/init/init.sequelize"

const likeService = {
  // API LẤY TOÀN BỘ DATA
  getLikeAll: async () => {
    const likeRes = await models.like_res.findAll();
    return likeRes;
  },

  // API POST LIKE
  postLikeRes: async (user_id, res_id) => {
    if (!user_id) {
      throw new BadrequestException(`Không có thông tin người dùng`);
    }
    if (!res_id) {
      throw new BadrequestException(`Không có thông tin nhà hàng`);
    }
    const existingLike = await models.like_res.findOne({
      where: { user_id, res_id },
    });

    if (existingLike) {
      if (existingLike.isActive) {
        return { message: "Bạn đã like nhà hàng này rồi" };
      } else {
        existingLike.isActive = true;
        await existingLike.save();
        return { message: "Đã like" };
      }
    }

    const postLike = await models.like_res.create({
      user_id,
      res_id,
      date_like: new Date(),
    });
    return postLike;
  },

  // API UNLIKE
  postUnlikeRes: async (user_id, res_id) => {
    if (!user_id) {
      throw new BadrequestException(`Không có thông tin người dùng`);
    }
    if (!res_id) {
      throw new BadrequestException(`Không có thông tin nhà hàng`);
    }

    const existingLike = await models.like_res.findOne({
      where: { user_id, res_id },
    });

    if (!existingLike || !existingLike.isActive) {
      return { message: "Chưa like hoặc đã unlike trước đó." };
    }

    existingLike.isActive = false;
    await existingLike.save();
    return { message: "Đã unlike thành công." };
  },

  // API TÍCH HỢP CẢ 2 API LIKE VÀ UNLIKE
  toggleLikeRes: async (user_id, res_id) => {
    if (!user_id) {
      throw new BadrequestException(`Không có thông tin người dùng`);
    }
    if (!res_id) {
      throw new BadrequestException(`Không có thông tin nhà hàng`);
    }

    const existingLike = await models.like_res.findOne({
      where: { user_id, res_id },
    });

    if (existingLike) {
      existingLike.isActive = !existingLike.isActive;
      if (existingLike.isActive) {
        existingLike.date_like = new Date();
      }
      await existingLike.save();
      return {
        message: existingLike.isActive
          ? "Đã Like thành công"
          : "Đã Unlike thành công",
      };
    }
    const postLike = await models.like_res.create({
      user_id,
      res_id,
      date_like: new Date(),
    });
    return postLike;
  },

  // API GET LIKE THEO NHÀ HÀNG
  getLikeRes: async (res_id) => {
    if (!res_id) {
      throw new BadrequestException("Không có thông tin nhà hàng");
    }
    const rest = await models.restaurant.findByPk(res_id);
    if (!rest) {
      throw new BadrequestException("Nhà hàng không tồn tại");
    }
    const likeRes = await models.like_res.findAll({
      where: {
        res_id,
        isActive: true,
      },
    });
    return likeRes;
  },
  // API GET LIKE THEO USER
  getLikeUser: async (user_id) => {
    if (!user_id) {
      throw new BadrequestException("Không có thông tin người dùng");
    }
    const user = await models.users.findByPk(user_id)
    if (!user) {
      throw new BadrequestException("Người dùng không tồn tại")
    }
    const likeUser = await models.like_res.findAll({
      where: {
        user_id,
        isActive: true,
      },
    });
    return likeUser;
  },
};
export default likeService