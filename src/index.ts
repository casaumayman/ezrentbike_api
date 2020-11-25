import "reflect-metadata";
import { createConnections, FileLogger, Connection, ConnectionOptions } from "typeorm";
import * as express from "express";
import { Request, Response } from "express";
import bodyParser = require("body-parser");
import { appRoutes } from "./routes";
import * as path from 'path';
import * as multer from 'multer';
import * as http from 'http';
import * as cors from 'cors';

function normalizePort(val) {
    var port = parseInt(val, 10);

    if (isNaN(port)) {
        // named pipe
        return val;
    }

    if (port >= 0) {
        // port number
        return port;
    }

    return false;
}

createConnections().then(async connection => {
    const app = express();
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded());
    app.use(
      cors({
        origin: "*",
        methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
        preflightContinue: false,
        optionsSuccessStatus: 200,
      })
    );

    const storage = multer.diskStorage({
        destination: (req, file, cb) => {
            if (file.fieldname === 'avatar')
                cb(null, __dirname + '/asset/avatar');
            else cb(null, __dirname + '/asset/image');
        },
        filename: (req, file, cb) => {
            cb(null, Date.now() + path.extname(file.originalname));
        }
    });
    const upload = multer({
        storage: storage
    });
    app.use(multer({
        storage: storage
    }).any());
    appRoutes.forEach(route => {
        app[route.method](route.path, (req: Request, res: Response, next: Function) => {
            route.action(req, res)
                .then(() => next)
                .catch(err => next(err));
        });
    });
    app.use(express.static('src'));
    app.use(express.static(path.join(__dirname, '../build')));


    app.get('/', function (req, res) {
        res.sendFile(path.join(__dirname, '../build', 'index.html'));
    });
    app.all('*', (req: Request, res: Response, next: Function) => {
        res.sendFile(path.join(__dirname, '../build', 'index.html'));
    })
    app.use((err, req: Request, res: Response, next: Function) => {
        //console.log(err.message);
        res.status(501);
        res.json({ err: err.message });
    });

    const port = normalizePort(process.env.PORT || 5000);
    app.set('port', port);
    const server = http.createServer(app);
    server.listen(port);
    console.log('running api on port: ' + port);
}).catch(error => console.log(error));
