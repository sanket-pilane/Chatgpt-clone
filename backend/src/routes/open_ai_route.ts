import { Router, Request, Response } from "express";
import { generateOpenAiResponseController } from "../controllers/generate_openai_controller";

const openAiRouter = Router();

openAiRouter.post("/", generateOpenAiResponseController);

export default openAiRouter;
