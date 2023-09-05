import { urlsSchema } from "../schemas/urlsSchema.js";

export const urlsvalid = (req, res, next) => {
    const { url } = req.body;
    const { error } = urlsSchema.validate({ url });
    if (error) {
        return res.sendStatus(400);
    }
    next();
}