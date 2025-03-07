import { onRequest } from "firebase-functions/v2/https";
import { Request, Response } from "express";

export const helloWorld = onRequest(
  { region: "asia-northeast1" },
  (req: Request, res: Response) => {
    res.send("Hello from Firebase!");
  }
);
