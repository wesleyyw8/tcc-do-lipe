var express = require('express');
var router = express.Router();

router.route('/:nome')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT * from BRINCADEIRA WHERE NOME_BRINC = '" +request.params.nome+ "'";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"resultado" : rows});
      });
    });
  });

module.exports = router;