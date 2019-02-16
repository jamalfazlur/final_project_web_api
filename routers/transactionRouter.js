var express = require('express');
var router = express.Router();
const { transactionController } = require('../controllers');

router.post('/addtocart', transactionController.addtocart);
router.post('/getlistcart', transactionController.getlistcart);

module.exports = router;