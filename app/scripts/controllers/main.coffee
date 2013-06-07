'use strict'

angular.module('boxpoolApp').controller 'MainCtrl', ($scope, $location, Product, ProductCategory) ->


  $scope.active = (path) ->
    active = path == $location.path()
    return active;


  $scope.products = Product.query()

  ProductCategory.query (category) ->
    $scope.categories = _( category ).sortBy('name')

  $scope.radio = { category: 'beauty'}






