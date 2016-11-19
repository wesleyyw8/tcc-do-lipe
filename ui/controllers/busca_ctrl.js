app.controller('BuscaController',
['$scope','$http','$routeParams','$location','dataService','buscaService', function($scope,$http,
routeParams,location,dataService,buscaService){

  if (!buscaService.busca)
    location.path('/');
  $scope.buscas = buscaService.busca.busca;
  console.log($scope.buscas);
}]);