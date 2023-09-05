import db from "../database/db.js";
import { nanoid } from "nanoid";

export async function shorteenUrl(req, res) {
  const user = req.user;
  const { url } = req.body;
  const shortUrl = nanoid(8);
  
  try {
    await db.query(
      `INSERT INTO shortens (url, "shortUrl", "userId") VALUES ($1, $2, $3)`,
      [url, shortUrl, user.id]
    );
    return res.status(201).send({ shortUrl });
  } catch (err) {
    return res.sendStatus(500);
  }
}
