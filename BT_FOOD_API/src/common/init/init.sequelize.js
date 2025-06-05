import { Sequelize } from "sequelize";
import initModels from "../../models/init-models";
import { DATABASE_URL } from "../constant/app.constant";

const sequelize = new Sequelize(DATABASE_URL, { logging: true });
export const models = initModels(sequelize);

export const authConnectDB = async () => {
  try {
    await sequelize.authenticate();
    console.log("SEQUELIZE::Connection has been established successfully.");
  } catch (error) {
    console.error("SEQUELIZE::Unable to connect to the database:", error);
  }
};
export default sequelize;
