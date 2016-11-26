var express = require('express');
var multer = require('multer');
var router = express.Router();
router.route('/create')
  .post(function (req, res) {
    res.send(console.log(req.body));
    res.send(console.log(req.file));
    res.send(console.log(req.files));
  });

module.exports = router;