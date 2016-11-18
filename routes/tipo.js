var express = require('express');
var router = express.Router();
router.route('/TIPO')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT NOME_TIPO from TIPO";
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"TIPO" : rows});
      });
    });
  });

module.exports = router;