import {registerSchema} from "../schemas/authSchema.js";
import db from "../database/db.js";
import bcrypt from "bcrypt";

export async function registerUser(req, res, next) {
  // const user = req.body;
  // const { name, email, password } = user;
  // const passwordHash = await bcrypt.hash(password, 10);
  // const usercreated = { name, email, password: passwordHash };

  // const { error } = registerSchema.validate(user, {
  //   abortEarly: false,
  // });

  // if (error) {
  //   const errors = error.details.map((detail) => detail.message);
  //   return res.status(400).send({ errors });
  // }

  // const emailExists = await db.query("SELECT * FROM users WHERE email = $1", [
  //   user.email,
  // ]);
  // if (emailExists.rows.length > 0) {
  //   return res.status(400).json({ message: "Email already exists" });
  // }

  
  
  
  // res.locals.user = usercreated;
  // console.log()
  next();
}

