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