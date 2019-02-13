var express = require('express');
var router = express.Router();
const { transactionController } = require('../controllers');

router.post('/addtocart', transactionController.addtocart);

module.exports = router;