import { handleError } from "./src/common/helpers/handle-err.helper";
import { authConnectDB } from "./src/common/init/init.sequelize";
import express from "express";
import cors from "cors"
import rootRouter from "./src/routers/root.router";

var app = express();

authConnectDB();
app.use(express.json());
app.use(cors());
app.use( rootRouter);
app.use(handleError);

app.listen(3069, () => {
  console.log(`Server running on port http://localhost:3069`);
});
