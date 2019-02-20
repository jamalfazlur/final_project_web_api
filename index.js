const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
//const mysql = require('mysql');
var app = express({defaultErrorHandler:false});

var port = process.env.PORT || 1997;

app.use(cors())
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())
app.use(express.static('public'))

app.get('/', (req,res) => {
    res.send('<h1>Selamat Datang di API!</h1>')
})

const { authRouter, productRouter, transactionRouter } = require('./routers');

app.use('/auth', authRouter);
app.use('/product', productRouter);
app.use('/transaction', transactionRouter);

app.listen(port, () => console.log('API Aktif di port ' + port))