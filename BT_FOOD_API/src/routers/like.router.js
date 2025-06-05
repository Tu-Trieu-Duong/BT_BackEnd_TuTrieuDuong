import express from "express"
import likeController from "../controllers/like.controller"

const likeRouter = express.Router()
likeRouter.get("/likeAll", likeController.getLikeAll);
likeRouter.post("/likeRes", likeController.postLikeRes);
likeRouter.post("/unlikeRes", likeController.postUnlikeRes);
likeRouter.post("/toggleLikeRes", likeController.toggleLikeRes);
likeRouter.get("/likeRes/:res_id", likeController.getLikeRes);
likeRouter.get("/likeUser/:user_id", likeController.getLikeUser);
export default likeRouter
 