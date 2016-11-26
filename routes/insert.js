var express = require('express');
var router = express.Router();

router.route('/:nome/:descricao/:aplicacao/:autor/:imagem/:amb/:classe/:mat/:tipo/:porte')
  .get(function(request,response){
    getConnection(function(error, con){
      if(error) throw error;
      var query = "Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC, AUTOR_BRINC,IMAGEM_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('"+request.params.nome+"','"+request.params.descricao+"','"+request.params.aplicacao+"','"+request.params.autor+"','"+request.params.imagem+"','"+request.params.amb+"','"+request.params.classe+"','"+request.params.mat+"','"+request.params.tipo+"','"request.params.porte+"')";
      console.log(query);
      con.query(query,function(err,rows){
        if(err) throw err;
        console.log('Data received from Db:\n');
        response.json({"busca" : rows});
      });
    });
  });

module.exports = router;