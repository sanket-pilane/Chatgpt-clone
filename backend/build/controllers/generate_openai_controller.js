"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __asyncValues = (this && this.__asyncValues) || function (o) {
    if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
    var m = o[Symbol.asyncIterator], i;
    return m ? m.call(o) : (o = typeof __values === "function" ? __values(o) : o[Symbol.iterator](), i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () { return this; }, i);
    function verb(n) { i[n] = o[n] && function (v) { return new Promise(function (resolve, reject) { v = o[n](v), settle(resolve, reject, v.done, v.value); }); }; }
    function settle(resolve, reject, d, v) { Promise.resolve(v).then(function(v) { resolve({ value: v, done: d }); }, reject); }
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateOpenAiResponseController = void 0;
const openai_1 = __importDefault(require("openai"));
const generateOpenAiResponseController = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a, e_1, _b, _c;
    try {
        const body = req.body;
        // const prompt = body["prompt"];
        const messages = body["messages"];
        const openai = new openai_1.default({
            apiKey: process.env.OPENAI_API_KEY,
        });
        const strem = yield openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: messages,
            temperature: 1,
            max_tokens: 512,
            top_p: 1,
            frequency_penalty: 0,
            presence_penalty: 0,
            stream: true,
        });
        res.set({ "Content-Type": "text/event-stream" });
        try {
            for (var _d = true, strem_1 = __asyncValues(strem), strem_1_1; strem_1_1 = yield strem_1.next(), _a = strem_1_1.done, !_a; _d = true) {
                _c = strem_1_1.value;
                _d = false;
                const chunk = _c;
                const data = chunk.choices[0].delta.content || "";
                const formattedData = `data: ${JSON.stringify({ data })}\n\n`;
                res.write(formattedData);
            }
        }
        catch (e_1_1) { e_1 = { error: e_1_1 }; }
        finally {
            try {
                if (!_d && !_a && (_b = strem_1.return)) yield _b.call(strem_1);
            }
            finally { if (e_1) throw e_1.error; }
        }
    }
    catch (error) {
        console.log(error);
        res.status(500).json({ err: error });
    }
});
exports.generateOpenAiResponseController = generateOpenAiResponseController;
