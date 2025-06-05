import { responseSuccess } from "../common/helpers/response.helper";
import likeService from "../services/like.service";

const likeController = {
  getLikeAll: async (req, res, next) => {
    try {
      const result = await likeService.getLikeAll();
      const resData = responseSuccess(result, "Gọi API getLikeRes thành công");
      res.status(resData.statusCode).json(resData);
    } catch (error) {
      console.log({ error: error.message });
      next(error);
    }
  },
  postLikeRes: async (req, res, next) => {
    try {
      const { user_id, res_id } = req.body;
      const result = await likeService.postLikeRes(user_id, res_id);
      const resData = responseSuccess(result, "Gọi API postLikeRes thành công");
      res.status(resData.statusCode).json(resData);
    } catch (error) {
      console.log({ error: error.message });
      next(error);
    }
  },
  postUnlikeRes: async (req, res, next) => {
    try {
      const { user_id, res_id } = req.body;
      const result = await likeService.postUnlikeRes(user_id, res_id);
      const resData = responseSuccess(
        result,
        "Gọi API postUnlikeRes thành công"
      );
      res.status(resData.statusCode).json(resData);
    } catch (error) {
      console.log({ error: error.message });
      next(error);
    }
  },
  toggleLikeRes: async (req, res, next) => {
    try {
      const { user_id, res_id } = req.body;
      const result = await likeService.toggleLikeRes(user_id, res_id);
      const resData = responseSuccess(
        result,
        "Gọi API toggleLikeRes thành công"
      );
      res.status(resData.statusCode).json(resData);
    } catch (error) {
      console.log({ error: error.message });
      next(error);
    }
  },
  getLikeRes: async (req, res, next) => {
    try {
      const { res_id } = req.params;
      const result = await likeService.getLikeRes(res_id);
      const resData = responseSuccess(result, "Gọi API getLikeRes thành công");
      res.status(resData.statusCode).json(resData);
    } catch (error) {
      console.log({ error: error.message });
      next(error);
    }
  },
  getLikeUser: async (req, res, next) => {
    try {
      const { user_id } = req.params;
      const result = await likeService.getLikeUser(user_id);
      const resData = responseSuccess(result, "Gọi API getLikeUser thành công");
      res.status(resData.statusCode).json(resData);
    } catch (error) {
      console.log({ error: error.message });
      next(error);
    }
  },
};

export default likeController;
