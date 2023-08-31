import db from "../database/db.js";
import bcrypt from "bcrypt";
import {v4 as uuidv4} from "uuid";

export async function createUser(req,res){
    const { name, email, password } = req.body;
   
    try{
        const userexists = await db.query("SELECT * FROM users WHERE email = $1", [email]);
        if (userexists.rows.length > 0) { return res.sendStatus(409); }

        const passwordHash = await bcrypt.hash(password, 10);

        await db.query( 
            "INSERT INTO users (name, email, password) VALUES ($1, $2, $3)", [name, email, passwordHash]
        ); 
        res.sendStatus(201); 
    }   catch (error) {
        res.status(422).send(err.message);
    }  
}

export async function userSignIn(req, res) {
    const { email, password } = req.body;
    const token = ""
    
    try {   
        const result = await db.query(
            "SELECT * FROM users WHERE email = $1", [email]
        ); 
        const user = result.rows[0];
        if (!user) { return res.sendStatus(401); }
            
        if (bcrypt.compareSync (password, user.password)) {
            const token = uuidv4();
            await db.query(
                "INSERT INTO sessions (token, \"userId\") VALUES ($1, $2)", [token, user.id]
            );
            res.send({ token });
        }
        
    }

  catch (error) {
    res.status(422).send(error.message);
}
}