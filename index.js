const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
var app = express();

var port = process.env.PORT || 1997;

app.use(bodyParser.json());
app.use(cors());

app.get('/', (req,res) => {
    res.send('<h1>Selamat Datang di API!</h1>')
})

const { authRouter, productRouter } = require('./routers');

app.use('/auth', authRouter);
app.use('/product', productRouter);

app.listen(port, () => console.log('API Aktif di port ' + port))