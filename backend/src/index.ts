import express, { Express } from "express";
import http from "http";
import bodyParser from "body-parser";
import cors from "cors";
import dotenv from "dotenv";
import router from "./routes/router";

// initalizing the server and loading environment variables
const app: Express = express();
const server = http.createServer(app);

// middlewares
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set("PORT", 5157);
app.set("BASE", "localhost");
dotenv.config();
app.use("/api", router);

try {
  const PORT = app.get("PORT");
  server.listen(PORT, (): void => {
    console.log("Server Started");
  });
} catch (error) {
  console.log(error);
}

export default server;
