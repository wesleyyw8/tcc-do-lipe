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