var express = require('express');
var app = express();
var mysql = require("mysql");
var bodyParser = require('body-parser');
var formidable = require('formidable');
//var util = require('util');
var portNumber = 3001;
app.use(bodyParser.json());
app.use(express.static(__dirname + '/ui/views')); 
app.use(express.static(__dirname + '/ui')); 

var pool  =    mysql.createPool({
  connectionLimit : 100, //important
  host     : 'localhost',
 // port     :  3301,
  user     : 'root',
  password : 'q1w2e3r4',
  database : 'dbmesaj',
  debug    :  false
});

getConnection = function(callback) {
  pool.getConnection(function(err, connection) {
    if (err) {
      connection.release();
      res.json({"code" : 100, "status" : "Error in connection database"});
      return;
    }
    callback(err, connection);
  });
};

var baseUrl = '/endpoints/';
var ambiente = require('./routes/ambiente');
app.use(baseUrl+'ambiente', ambiente);


var materia = require('./routes/materia');
app.use(baseUrl+'materia', materia);

var classificacao = require('./routes/classificacao');
app.use(baseUrl+'classificacao', classificacao);

var tipo = require('./routes/tipo');
app.use(baseUrl+'tipo', tipo);

var porte = require('./routes/porte');
app.use(baseUrl+'porte', porte);

var buscar = require('./routes/buscar');
app.use(baseUrl+'buscar', buscar);

var resultado = require('./routes/resultado');
app.use(baseUrl+'resultado', resultado);

app.post('/endpoints/brincadeira/create', function (req, res, next) {
  var form = new formidable.IncomingForm();
  form.uploadDir = __dirname + '/ui/img';
  var fileName = "";
  var outerFields = {};
  form.parse(req, function (err, fields, files) {
    outerFields = fields;
  });
  form
    .on('fileBegin', function(field, file) {
      file.path = form.uploadDir + "/" + file.name;
      fileName = file.name;
    })
    .on('end', function() {
      checkAmb(res,fileName, outerFields);
      checkMateria(res,fileName, outerFields);
      checkPorte(res,fileName, outerFields);
      checkClass(res,fileName, outerFields);
      checkTipo(res,fileName, outerFields);
      insertBrincadeira(res,fileName, outerFields);
    });
  form.parse(req);
});

function checkAmb(res,fileName,outerFields){
  getConnection(function(error, con){
    if(error) throw error;
    var query = "SELECT * from AMBIENTE WHERE NOME_AMB = '"+outerFields.ambiente+"'";
    con.query(query,function(err,rows){
      if(err) throw err;
      if (rows.length == 0){
        var query = "INSERT into AMBIENTE (NOME_AMB) values ('"+outerFields.ambiente+"')";
        con.query(query,function(err,rows){if(err) throw err;});
      }
    });
  });
}

function checkMateria(res,fileName,outerFields){
  getConnection(function(error, con){
    if(error) throw error;
    var query = "SELECT * from MATERIA WHERE NOME_MATERIA = '"+outerFields.assunto+"'";
    con.query(query,function(err,rows){
      if(err) throw err;
      if (rows.length == 0){
        var query = "INSERT into MATERIA (NOME_MATERIA) values ('"+outerFields.assunto+"')";
        con.query(query,function(err,rows){if(err) throw err;});
      }
    });
  });
}

function checkPorte(res,fileName,outerFields){
  getConnection(function(error, con){
    if(error) throw error;
    var query = "SELECT * from PORTE WHERE NOME_PORTE = '"+outerFields.porte+"'";
    con.query(query,function(err,rows){
      if(err) throw err;
      if (rows.length == 0){
        var query = "INSERT into PORTE (NOME_PORTE) values ('"+outerFields.porte+"')";
        con.query(query,function(err,rows){if(err) throw err;});
      }
    });
  });
}

function checkClass(res,fileName,outerFields){
  getConnection(function(error, con){
    if(error) throw error;
    var query = "SELECT * from CLASSIFICACAO_ETARIA WHERE NOME_CLASS = '"+outerFields.classificacao+"'";
    con.query(query,function(err,rows){
      if(err) throw err;
      if (rows.length == 0){
        var query = "INSERT into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('"+outerFields.classificacao+"')";
        con.query(query,function(err,rows){if(err) throw err;});
      }
    });
  });
}

function checkTipo(res,fileName,outerFields){
  getConnection(function(error, con){
    if(error) throw error;
    var query = "SELECT * from TIPO WHERE NOME_TIPO = '"+outerFields.tipo+"'";
    con.query(query,function(err,rows){
      if(err) throw err;
      if (rows.length == 0){
         var query = "INSERT into TIPO (NOME_TIPO) values ('"+outerFields.tipo+"')";
         con.query(query,function(err,rows){if(err) throw err;}); 
         res.json({"ok": 'ok'});
      }
    });
  });
}

function insertBrincadeira(res,fileName,outerFields){
  getConnection(function(error, con){
    if(error) throw error;
    var query = "Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC, AUTOR_BRINC,IMAGEM_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('"+outerFields.nomeBrincadeira+"','"+outerFields.descricao+"','"+outerFields.aplicacao+"','"+outerFields.autor+"','"+fileName+"','"+outerFields.ambiente+"','"+outerFields.classificacao+"','"+outerFields.assunto+"','"+outerFields.tipo+"','"+outerFields.porte+"')";
      console.log(query);
      con.query(query,function(err,rows){if(err) throw err;});
      });
    }
 

app.use(express.static(__dirname + '/ui'));

app.get('*', function(req, res) {
  res.sendfile('./ui/views/index.html');
});

app.listen(portNumber, function(){
  console.log('funcionando na porta: '+portNumber);
});
