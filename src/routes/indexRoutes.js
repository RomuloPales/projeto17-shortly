import { Router } from "express";
import authroutes from "./authRoutes.js";
import urlsRoutes from "./urlsRoutes.js";

const router = Router();

router.use(authroutes)
router.use(urlsRoutes)


export default router;
