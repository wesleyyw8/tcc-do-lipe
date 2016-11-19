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