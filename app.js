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
  password : '',
  database : 'MOVIES_PROJECT',
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

app.get('*', function(req, res) {
  res.sendfile('./ui/views/index.html'); // load the single view file (angular will handle the page changes on the front-end)
});