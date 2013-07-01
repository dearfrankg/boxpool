'use strict'



app = angular.module('boxpoolApp')
  
app.controller 'ProductListCtrl', [
  '$scope', 'Product', 'Category', 
  ($scope, Product, Category) ->

    $scope.radio = {}

    Category.query (categories) ->
      $scope.categories = categories      
      $scope.radio.category = $scope.categories[0].code || ''

    Product.query (products) ->
      $scope.products = products

]


app.controller 'ProductEditCtrl', [
  '$scope', 'Category', 'Product', '$routeParams', '$location', '$filter'
  ($scope, Category, Product, $routeParams, $location, $filter) ->

    self

    $scope.options = Category.query()

    Product.get({ id: $routeParams.productID }, (product) ->
      self.original = product
      $scope.product = new Product(self.original)
      $scope.product.category ||= $scope.options[0].code
    )

    $scope.isClean = ->
      return angular.equals(self.original, $scope.product)

    $scope.destroy = ->
      return unless confirm("Are you sure?")
      self.original.destroy ->
        $location.path('/products')
   
    $scope.save = ->
      $scope.product.update ->
        self.original = $scope.product
        $scope.product = new Product(self.original)
        $location.path('/products/' + $scope.product._id.$oid)


]


app.controller 'ProductCreateCtrl', [
  '$scope', 'Product', '$location', 'Category', 
  ($scope, Product, $location, Category) ->

    $scope.product = {}

    Category.query (categories) ->
      $scope.options = categories
      $scope.product.category ||= $scope.options[0].code

    $scope.save = ->
      Product.save $scope.product, (product) ->
        $location.path('/products/' + product._id.$oid)

]



























