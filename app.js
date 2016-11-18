var express = require('express');
var app = express();
var mysql = require("mysql");
var portNumber = 3001;

app.use(express.static(__dirname + '/ui/views')); 
app.use(express.static(__dirname + '/ui')); 

var pool  =    mysql.createPool({
  connectionLimit : 100, //important
  host     : 'localhost',
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

var server = app.listen(portNumber,function(){
  console.log("We have started our server on port! "+portNumber);
});
var router = express.Router();

var ambiente = require('./routes/ambiente');
app.use('/ambiente', ambiente);

var materia = require('./routes/materia');
app.use('/materia', materia);

var classificacao = require('./routes/classificacao');
app.use('/classificacao', classificacao);

var tipo = require('./routes/tipo');
app.use('/tipo', tipo);

var porte = require('./routes/porte');
app.use('/porte', porte);

app.get('*', function(req, res) {
  res.sendfile('./ui/views/index.html'); // load the single view file (angular will handle the page changes on the front-end)
});

