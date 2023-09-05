import db from "../database/db.js";

export async function authorizationValidation(req, res, next){
   
    const {authorization} = req.headers;
    
    const token =   authorization?.replace("Bearer ", "");
  
    if(!token){
        return res.sendStatus(401);
    }
    try{
        const {rows: sessions} = await db.query("SELECT * FROM sessions WHERE token = $1", [token]); 
        if(sessions.length === 0){
            return res.sendStatus(401);
        }   
       
        const [session] = sessions;

        if(!session){
            return res.sendStatus(401);
        }
        const {rows: user} = await db.query("SELECT * FROM users WHERE id = $1", [session.userId]);
        if(user.length === 0){
            return res.sendStatus(401);
        }

        const [userFound] = user;
        
        req.user = userFound;
        next();

    }catch(error){
        return res.sendStatus(401);
    }

}