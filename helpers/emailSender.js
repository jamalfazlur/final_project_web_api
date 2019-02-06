const nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'fazlur.jamal@gmail.com',
        pass: 'jzxonchxvagzjgfa'
    }, 
    tls: {
        rejectUnauthorized: false
    }
})

module.exports = transporter;