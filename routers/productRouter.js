var express = require('express');
var router = express.Router();
const { productController } = require('../controllers');

router.get('/getproduct', productController.getproduct);
router.get('/getproductdetail/:isbn', productController.getproductdetail);
router.post('/addproduct', productController.addproduct);
router.put('/editproduct/:isbn', productController.editproduct);
router.delete('/deleteproduct/:isbn', productController.deleteproduct);
router.post('/searchproduct', productController.searchproduct);

module.exports = router;