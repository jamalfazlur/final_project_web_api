var express = require('express');
var router = express.Router();
const { productController } = require('../controllers');

router.get('/getproduct', productController.getproduct);
router.get('/getproductdetail/:isbn', productController.getproductdetail);
router.post('/addproduct', productController.addproduct);

module.exports = router;