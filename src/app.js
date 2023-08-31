import db from './database/db.js';
import expres from 'express';
import cors from 'cors';


const app = expres();
app.use(cors());
app.use(expres.json());



const port = process.env.PORT || 4000;
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
}  );


 