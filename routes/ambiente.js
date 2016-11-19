var express = require('express');
var router = express.Router();

router.route('/')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT ID_AMBIENTE as id, NOME_AMBIENTE as value from AMBIENTE";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"ambiente": rows});
      });
    });
  });

module.exports = router;