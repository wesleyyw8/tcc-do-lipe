var express = require('express');
var router = express.Router();

router.route('/:mat/:classe/:tipo/:amb/:porte')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "SELECT NOME_BRINC, APLICACAO_BRINC from BRINCADEIRA WHERE ";
      if (request.params.mat != 'null')
        query += ' MAT = "'+request.params.mat+'"';

      console.log(query);
      if (request.params.classe != 'null')
        query += " and CLASS = '"+request.params.classe+ "'";
      if (request.params.tipo != 'null')
        query += " and TIPO = '"+request.params.tipo+ "'";
      if (request.params.amb != 'null')
        query += " and AMB = '"+request.params.amb+ "'";
      if (request.params.porte != 'null')
        query += " and PORTE= '"+request.params.porte+ "'";

      //WHERE MAT = 'Aritmética' and CLASS= 'Primario' and TIPO = 'Tabuleiro' and AMB = 'Interno' and porte= 'Pequeno';
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"busca" : rows});
      });
    });
  });

module.exports = router;