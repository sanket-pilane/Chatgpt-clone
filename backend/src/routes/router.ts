import { Router } from "express";
import helloRouter from "./hello_router";
import openAiRouter from "./open_ai_route";

const router = Router();

router.use("/generate_response", openAiRouter);
router.use("/hello", helloRouter);

export default router;
