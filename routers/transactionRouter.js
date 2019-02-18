var express = require('express');
var router = express.Router();
const { transactionController } = require('../controllers');

router.post('/addtocart', transactionController.addtocart);
router.post('/getlistcart', transactionController.getlistcart);
router.post('/editlistcart', transactionController.editlistcart);
router.post('/deleteitemcart', transactionController.deleteitemcart);
router.post('/addtransaction', transactionController.addtransaction);
router.post('/adddetailtransaction', transactionController.adddetailtransaction);
router.post('/clearcart', transactionController.clearcart);

module.exports = router;