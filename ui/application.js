var app = angular.module('tcclipe',['ngRoute']);

app.config(['$routeProvider', '$locationProvider', function($routeProvider,$locationProvider){
  $routeProvider.
    when('/principal', {
      templateUrl: '../views/principal.html',
      controller: 'PrincipalController'
    }).
    when('/busca', {
      templateUrl: '../views/busca.html',
      controller: 'BuscaController'
    }).
    otherwise({
      redirectTo: '/principal'
    });
}]);

app.factory('Config', [function() {
  var baseUrl = "/endpoints";
  return {
    base_url: baseUrl,
    endpoints: {
      materia: "/materia",
      classificacao: "/classificacao",
      tipo: "/tipo",
      ambiente: "/ambiente",
      porte: "/porte",
      buscar: "/buscar/"
    }
  };
}]);
app.controller('BuscaController',
['$scope','$http','$routeParams','$location','dataService','buscaService', function($scope,$http,
routeParams,location,dataService,buscaService){

  if (!buscaService.busca)
    location.path('/');
  $scope.buscas = buscaService.busca.busca;
  console.log($scope.buscas);
}]);
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
app.service('dataService', ["$q", "$http", "Config", function ($q, $http, Config) {
    var service = {
      getMateria: getMateria,
      getClassificacao: getClassificacao,
      getTipo: getTipo,
      getPorte: getPorte,
      getAmbiente: getAmbiente
    };
    return service;
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
  }]
);
app.controller('PrincipalController',
['$scope','$location','dataService','buscaService', function($scope,location,dataService,buscaService){
  (function loadSelects(){
    $scope.dropdownlists = {};
    dataService.getMateria().then(function(data){
      $scope.dropdownlists.materias = data.data;
    });
    dataService.getClassificacao().then(function(data){
      $scope.dropdownlists.classificacoes = data.data;
    });
    dataService.getPorte().then(function(data){
      $scope.dropdownlists.portes = data.data;
    });
    dataService.getTipo().then(function(data){
      $scope.dropdownlists.tipos = data.data;
    });
    dataService.getAmbiente().then(function(data){
      $scope.dropdownlists.ambientes = data.data;
    });
  })();

  function getSelectValues(){
    var result = "";
    if ($( ".assunto option:selected" ).text() == "Selecione" ){
      alert('Selecione um assunto.');
      return false
    }
    else{
      result += $( ".assunto option:selected" ).text() == "Selecione" ? "null/" : $( ".assunto option:selected" ).text().trim()+"/";
      result += $( ".classificacaoEnsino option:selected" ).text() == "Selecione" ? "null/" : $( ".classificacaoEnsino option:selected" ).text().trim()+"/";
      result += $( ".tipo option:selected" ).text() == "Selecione" ? "null/" : $( ".tipo option:selected" ).text().trim()+"/";
      result += $( ".ambiente option:selected" ).text() == "Selecione" ? "null/" : $( ".ambiente option:selected" ).text().trim()+"/";
      result += $( ".porte option:selected" ).text() == "Selecione" ? "null/" : $( ".porte option:selected" ).text().trim()+"/";
    }
    return result;
  }
  $scope.busca = function(){
    var temp = getSelectValues();
    if (temp){
      buscaService.buscaEndpoint(temp).then(function(data){
        location.path('/busca');
      });
    }
  }

}]);