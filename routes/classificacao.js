var express = require('express');
var router = express.Router();

router.route('/')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT ID_CLASS as id, NOME_CLASS as value from CLASSIFICACAO_ETARIA";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"data" : rows});
      });
    });
  });

module.exports = router;