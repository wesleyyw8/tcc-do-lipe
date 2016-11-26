app.service('dataService', ["$q", "$http", "Config", function ($q, $http, Config) {
    var service = {
      getMateria: getMateria,
      getClassificacao: getClassificacao,
      getTipo: getTipo,
      getPorte: getPorte,
      getAmbiente: getAmbiente,
      getResultado: getResultado,
      insertBrincadeira: insertBrincadeira 
    };
    return service;
    function insertBrincadeira(data){
      console.log(data);
      var def = $q.defer();
      $http.post(Config.base_url + Config.endpoints.criarBrincadeira, data, {
          transformRequest: angular.identity,
          headers: {'Content-Type': undefined}
        }).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }
    function getMateria(){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.materia).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }
    function getClassificacao(id){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.classificacao).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }
    function getTipo(id){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.tipo).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }
    function getAmbiente(id){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.ambiente).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }
    function getPorte(){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.porte).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }  
    function getResultado(param){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.resultado+param).success(function(data){
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }
  }]
);