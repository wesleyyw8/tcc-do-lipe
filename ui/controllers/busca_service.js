app.service('buscaService', ["$q", "$http", "Config", function ($q, $http, Config) {
    var service = {
      buscaEndpoint: buscaEndpoint
    };
    return service;
    function buscaEndpoint(param){
      var def = $q.defer();
      $http.get(Config.base_url + Config.endpoints.buscar+param).success(function(data){
        service.busca = data;
        def.resolve(data);
      })
      .error(function(){
        def.reject("fail");
      })
      return def.promise;
    }  
  }]
);