import express from 'express';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import BaseRouter from './routes/BaseRouter';
import initDB from './db';

const app = express();
const port = process.env.PORT || 8080;


(async () => {
    await initDB();

    app.use(morgan(':method :url :req[header]', {immediate: true}))

    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({ extended: true }));

    app.use(BaseRouter);

    app.listen(port, () => {
        // tslint:disable-next-line
        console.log(`server listening on port: ${port}`);
    })
})();