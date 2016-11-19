var express = require('express');
var router = express.Router();

router.route('/')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT ID_TIPO as id, NOME_TIPO as value from TIPO";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"tipo" : rows});
      });
    });
  });

module.exports = router;