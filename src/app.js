import db from './database/db.js';
import expres from 'express';
import cors from 'cors';
import router from './routes/indexRoutes.js';


const app = expres();
app.use(cors());
app.use(expres.json());


app.use(router)


const port = process.env.PORT || 4000;
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
}  );


 