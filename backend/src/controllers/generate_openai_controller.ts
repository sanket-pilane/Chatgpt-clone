import { ChildProcess } from "child_process";
import { Response, Request } from "express";
import OpenAI from "openai";

export const generateOpenAiResponseController = async (
  req: Request,
  res: Response
) => {
  try {
    const body = req.body;
    // const prompt = body["prompt"];
    const messages = body["messages"];

    const openai = new OpenAI({
      apiKey: process.env.OPENAI_API_KEY,
    });

    const strem = await openai.chat.completions.create({
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

    for await (const chunk of strem) {
      const data = chunk.choices[0].delta.content || "";
      const formattedData = `data: ${JSON.stringify({ data })}\n\n`;
      res.write(formattedData);
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ err: error });
  }
};
