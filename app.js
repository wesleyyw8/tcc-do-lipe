var express = require('express');
var app = express();
var mysql = require("mysql");
var bodyParser = require('body-parser');
var formidable = require('formidable');
var util = require('util');
var portNumber = 3001;
app.use(bodyParser.json());
app.use(express.static(__dirname + '/ui/views')); 
app.use(express.static(__dirname + '/ui')); 

var pool  =    mysql.createPool({
  connectionLimit : 100, //important
  host     : 'localhost',
  port     : 33060,
  user     : 'homestead',
  password : 'secret',
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
      console.log(fileName);
      console.log(outerFields);
      insereOsDados(res,fileName, outerFields);
    });
  form.parse(req);
});
function insereOsDados(res,fileName,outerFields){
  //inser into brincadeira values (outerFields.assunto, outerFields.classificacao, outerFields.tipo, fileName)

  res.json({
    "ok": "ok"
  })
}
app.use(express.static(__dirname + '/ui'));

app.get('*', function(req, res) {
  res.sendfile('./ui/views/index.html');
});

app.listen(portNumber, function(){
  console.log('funcionando na porta: '+portNumber);
});
