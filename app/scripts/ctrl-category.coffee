'use strict'



app = angular.module('boxpoolApp')
  
app.controller 'CategoryListCtrl', [
  '$scope', 'Category', 
  ($scope, Category) ->

    $scope.categories = Category.query()

]


app.controller 'CategoryEditCtrl', [
  '$scope', 'Category', '$routeParams', '$location'
  ($scope, Category, $routeParams, $location) ->

    self

    Category.get({ id: $routeParams.categoryID }, (category) ->
      self.original = category
      $scope.category = new Category(self.original)
    )

    $scope.isClean = ->
      return angular.equals(self.original, $scope.category)

    $scope.destroy = ->
      return unless confirm("Are you sure?")
      self.original.destroy ->
        $location.path('/categories')
   
    $scope.save = ->
      $scope.category.update ->
        self.original = $scope.category
        $scope.category = new Category(self.original)
        $location.path('/categories/' + $scope.category._id.$oid);

]


app.controller 'CategoryCreateCtrl', [
  '$scope', 'Category', '$location'
  ($scope, Category, $location) ->

    $scope.save = ->
      Category.save $scope.category, (category) ->
        $location.path('/categories/' + category._id.$oid);

]

