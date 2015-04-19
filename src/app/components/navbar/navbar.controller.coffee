angular.module "dashboard"
  .controller "NavbarCtrl", ($scope) ->
    $scope.date = new Date()
