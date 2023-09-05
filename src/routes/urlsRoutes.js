import expres from "express";
import cors from "cors";
import { authorizationValidation } from "../middleware/authorizationMiddleware.js";
import { shorteenUrl } from "../controllers/shorteenUrlController.js";
import { urlsvalid } from "../middleware/urlsValidMiddleware.js";

const router = expres.Router();

router.use(cors());
router.use(expres.json());

router.post("/urls/shorten", authorizationValidation, urlsvalid, shorteenUrl);

export default router;
