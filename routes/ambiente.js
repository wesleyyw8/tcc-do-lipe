var express = require('express');
var router = express.Router();
router.route('/ambiente')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT NOME_AMBIENTE from AMBIENTE";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"ambiente" : rows});
      });
    });
  });

module.exports = router;