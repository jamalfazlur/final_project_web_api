var express = require('express');
var router = express.Router();
const { authController } = require('../controllers');

router.post('/register', authController.register);
router.post('/signin', authController.signin);
router.post('/verified',authController.verified);

module.exports = router;