var express = require('express');
var router = express.Router();

router.route('/:mat')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT NOME_BRINC, APLICACAO_BRINC from BRINCADEIRA WHERE MAT = '"+request.params.mat+"'";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"busca" : rows});
      });
    });
  });

module.exports = router;