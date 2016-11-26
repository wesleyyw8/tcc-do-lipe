app.controller('AdicionarBrincadeiraController',
['$scope','$routeParams','dataService',function($scope,
routeParams,dataService){

  $scope.criarBrincadeira = function(){
    var obj = {
      img : $scope.img,
      nome: 'wes'
    }
    dataService.insertBrincadeira(obj).then(function(){
      console.log('deu certo!');
    });
  }
}]);