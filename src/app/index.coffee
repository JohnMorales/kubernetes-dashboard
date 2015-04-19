angular.module 'dashboard', ['ngAnimate', 'ngResource', 'ui.router', 'ui.bootstrap']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html",
        controller: "MainCtrl"

    $urlRouterProvider.otherwise '/'

