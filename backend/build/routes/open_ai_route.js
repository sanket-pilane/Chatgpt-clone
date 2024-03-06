"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const generate_openai_controller_1 = require("../controllers/generate_openai_controller");
const openAiRouter = (0, express_1.Router)();
openAiRouter.post("/", generate_openai_controller_1.generateOpenAiResponseController);
exports.default = openAiRouter;
