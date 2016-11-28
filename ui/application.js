var app = angular.module('tcclipe',['ngRoute','file-model']);

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
    when('/atividade/:atividadeName', {
      templateUrl: '../views/atividade.html',
      controller: 'AtividadeController'
    }).
    when('/adicionarBrincadeira', {
      templateUrl: '../views/adicionar-brincadeira.html',
      controller: 'AdicionarBrincadeiraController'
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
      buscar: "/buscar/",
      resultado: "/resultado/",
      criarBrincadeira: "/brincadeira/create"
    }
  };
}]);
app.controller('AdicionarBrincadeiraController',
['$scope','$routeParams','dataService',function($scope,
routeParams,dataService){

  $scope.criarBrincadeira = function(){
    var obj = {
      img : $scope.img,
      assunto: $scope.assunto || 'assteste',
      classificacao: $scope.classificacao || 'classteste',
      tipo: $scope.tipo || 'tiiiteste',
      ambiente: $scope.ambiente || 'ambteste',
      porte: $scope.porte || 'porrteste',
      aplicacao: $scope.aplicacao || 'aplicacaoteste',
      descricao: $scope.descricao || 'descricaotesteee',
      autor: $scope.autor || 'autortesteee',
      nomeBrincadeira: $scope.nomeBrincadeira || 'nomebrincstesste'
    }
    console.log(obj.descricao);
    dataService.insertBrincadeira(obj).then(function(){
      alert('deu certo!');
      cleanFields();
    });
  }
  function cleanFields(){
    $scope.assunto = "";
    $scope.classificacao = "";
    $scope.tipo = "";
    $scope.ambiente = "";
    $scope.porte = "";
    $scope.aplicacao = "";
    $scope.descricao = "";
    $scope.autor = "";
    $scope.nomeBrincadeira = "";
  }
}]);
app.controller('AtividadeController',
['$scope','$routeParams','dataService','buscaService', function($scope,
routeParams,dataService,buscaService){
  $scope.atividadeName = routeParams.atividadeName.trim();
  (function loadData(){
    dataService.getResultado($scope.atividadeName).then(function(data){
      $scope.resultado = data.resultado;
    })
  })();
}]);
app.controller('BuscaController',
['$scope','$http','$routeParams','$location','dataService','buscaService', function($scope,$http,
routeParams,location,dataService,buscaService){

  if (!buscaService.busca)
    location.path('/');
  else{
    $scope.buscas = buscaService.busca.busca;
  }
  $scope.goTo = function(name){
    location.path('/atividade/'+name);
  }
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
      getAmbiente: getAmbiente,
      getResultado: getResultado,
      insertBrincadeira: insertBrincadeira 
    };
    return service;
    function insertBrincadeira(data){
      var fd = new FormData();

      fd.append('teste', data.img);
      //fd.append('lala', 'wesss');
      angular.forEach(Object.keys(data),function(val){
        if (val != "img"){
          fd.append(val, data[val]);    
        }
      });

      var def = $q.defer();
      $http.post(Config.base_url + Config.endpoints.criarBrincadeira, fd, {
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
app.controller('NavBarController',
['$scope','$window', function($scope,window){
  $scope.imgClick = function(){
    window.history.back();
  }
}]);
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