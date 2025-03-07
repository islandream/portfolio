import { onRequest } from "firebase-functions/v2/https";
import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import cors from "cors";
import { Request, Response } from "express";

// Firebase Admin 초기화
initializeApp();
const firestore = getFirestore();
const corsHandler = cors({ origin: true });

export const getVisitorIp = onRequest(
  { region: "asia-northeast1" },
  async (req: Request, res: Response): Promise<void> => {
    corsHandler(req, res, async () => {
      try {
        const ip = (req.headers["x-forwarded-for"] as string) || req.socket.remoteAddress;

        if (!ip) {
          res.status(400).send("IP를 가져올 수 없습니다.");
          return;
        }

        const today = new Date().toISOString().split("T")[0];
        const visitorDoc = firestore.collection("visitors").doc(today);

        await firestore.runTransaction(async (transaction) => {
          const snapshot = await transaction.get(visitorDoc);

          if (snapshot.exists) {
            const data = snapshot.data();
            const currentCount = data?.count || 0;
            const ipList: string[] = data?.ips || [];

            if (!ipList.includes(ip)) {
              ipList.push(ip);
              transaction.update(visitorDoc, { count: currentCount + 1, ips: ipList });
            }
          } else {
            transaction.set(visitorDoc, { count: 1, ips: [ip] });
          }
        });

        res.status(200).send("📊 방문자 수 업데이트 및 IP 저장 완료!");
      } catch (error) {
        console.error("🔥 오류 발생:", error);
        res.status(500).send("서버 오류 발생");
      }
    });
  }
);
