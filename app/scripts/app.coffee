'use strict'

angular.module('boxpoolApp', ['productServices'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/products',
        templateUrl: 'views/products.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  ]
