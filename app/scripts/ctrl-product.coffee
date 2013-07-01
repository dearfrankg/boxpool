'use strict'



app = angular.module('boxpoolApp')
  
app.controller 'ProductListCtrl', [
  '$scope', 'Product', 'categoryList',
  ($scope, Product, categoryList) ->

    $scope.categories = categoryList
    $scope.products = Product.query()
    $scope.radio = { category: 'beauty'}

]


app.controller 'ProductEditCtrl', [
  '$scope', 'categoryList', 'Product', '$routeParams', '$location', '$filter'
  ($scope, categoryList, Product, $routeParams, $location, $filter) ->

    self

    $scope.options = categoryList

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
  '$scope', 'Product', '$location'
  ($scope, Product, $location) ->

    $scope.save = ->
      Product.save $scope.product, (product) ->
        $location.path('/products/' + product._id.$oid)

]

