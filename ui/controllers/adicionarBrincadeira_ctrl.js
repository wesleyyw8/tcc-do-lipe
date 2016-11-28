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
    angular.element("#descricao").val('');
    angular.element("#aplicacao").val('');
    $scope.autor = "";
    $scope.nomeBrincadeira = "";
  }
}]);