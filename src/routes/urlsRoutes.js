import expres from "express";
import cors from "cors";
import { authorizationValidation } from "../middleware/authorizationMiddleware.js";
import { deleteShortlyUrl, getRoutesUser, shorteenUrl, urlShortlyopen } from "../controllers/shorteenUrlController.js";
import { urlsvalid } from "../middleware/urlsValidMiddleware.js";

const router = expres.Router();

router.use(cors());
router.use(expres.json());

router.post("/urls/shorten", authorizationValidation, urlsvalid, shorteenUrl);
router.get("/urls/:id", getRoutesUser)
router.get("/urls/open/:shortUrl", urlShortlyopen)
router.delete("/urls/:id", authorizationValidation, deleteShortlyUrl)



export default router;
