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