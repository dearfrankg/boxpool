'use strict'

angular.module('boxpoolApp')
  .controller 'MainCtrl', ['$scope', '$location', 'Product', ($scope, $location, Product) ->


    $scope.active = (path) ->
      active = path == $location.path()
      return active;
  

    $scope.products = Product.query()

    $scope.phones = Product.query();


  ]
