"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const http_1 = __importDefault(require("http"));
const body_parser_1 = __importDefault(require("body-parser"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const router_1 = __importDefault(require("./routes/router"));
// initalizing the server and loading environment variables
const app = (0, express_1.default)();
const server = http_1.default.createServer(app);
// middlewares
app.use((0, cors_1.default)());
app.use(body_parser_1.default.json());
app.use(body_parser_1.default.urlencoded({ extended: true }));
app.set("PORT", 5157);
app.set("BASE", "localhost");
dotenv_1.default.config();
app.use("/api", router_1.default);
try {
    const PORT = app.get("PORT");
    server.listen(PORT, () => {
        console.log("Server Started");
    });
}
catch (error) {
    console.log(error);
}
exports.default = server;
