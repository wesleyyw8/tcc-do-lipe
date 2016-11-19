app.controller('NavBarController',
['$scope','$window', function($scope,window){
  $scope.imgClick = function(){
    window.history.back();
  }
}]);