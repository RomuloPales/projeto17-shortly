
import expres from 'express';
import cors from 'cors';
import { createUser, userSignIn } from '../controllers/authController.js';


const router = expres.Router();

router.use(cors());
router.use(expres.json());

router.post('/signup', createUser);
router.post('/signin', userSignIn)


export default router;