var express = require('express');
var router = express.Router();
router.route('/CLASSIFICACAO')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT NOME_CLASS from CLASSIFICACAO_ETARIA";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"CLASSIFICACAO" : rows});
      });
    });
  });

module.exports = router;