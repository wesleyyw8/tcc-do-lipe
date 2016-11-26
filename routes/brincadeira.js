var express = require('express');
var router = express.Router();
router.route('/create')
  .post(function (req, res) {
    res.send(console.dir(req.files));
  });

module.exports = router;