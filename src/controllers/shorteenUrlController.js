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

export async function getRoutesUser(req, res) {
  const { id } = req.params;

  try {
    const result = await db.query(
      'SELECT "userId" as "id","url" , "shortUrl" FROM shortens WHERE "userId" = $1',
      [id]
    );
    const shortUrls = result.rows;

    if (!shortUrls) {
      return res.sendStatus(404);
    }
    res.status(200).send(shortUrls);
  } catch (error) {
    res.status(422).send(error.message);
  }
}

export async function urlShortlyopen(req, res) {
  const { shortUrl } = req.params;
  try {
    const result = await db.query(
      'SELECT * FROM shortens WHERE "shortUrl" = $1',
      [shortUrl]
    );
    const url = result.rows[0];
    if (!url) {
      return res.sendStatus(404);
    }
    res.redirect(url.url);
  } catch (error) {
    res.status(422).send(error.message);
  }
}

export async function deleteShortlyUrl(req, res) {
  const user = req.user;
  const { id } = req.params;

  if (!id) {
    return res.sendStatus(401);
  }
  try {
    const result = await db.query(
      'SELECT * FROM shortens WHERE "userId" = $1 AND "id" = $2',
      [user.id, id]
    );

    if (result.rowCount === 0) {
      return res.sendStatus(404);
    }

    await db.query('DELETE FROM shortens WHERE "userId" = $1 AND "id" = $2', [
      user.id,
      id,
    ]);
    res.sendStatus(204);
  } catch (error) {
    console.log(error);
  }
}
