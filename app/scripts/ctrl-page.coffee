'use strict'



app = angular.module('boxpoolApp')
  
app.controller 'PageListCtrl', [
  '$scope', 'Page', 
  ($scope, Page) ->

    $scope.pages = Page.query()

]


app.controller 'PageEditCtrl', [
  '$scope', 'Page', '$routeParams', '$location'
  ($scope, Page, $routeParams, $location) ->

    self

    Page.get({ id: $routeParams.pageID }, (page) ->
      self.original = page
      $scope.page = new Page(self.original)
    )

    $scope.isClean = ->
      return angular.equals(self.original, $scope.page)

    $scope.destroy = ->
      return unless confirm("Are you sure?")
      self.original.destroy ->
        $location.path('/pages')
   
    $scope.save = ->
      $scope.page.update ->
        self.original = $scope.page
        $scope.page = new Page(self.original)
        $location.path('/pages/' + $scope.page._id.$oid);

]


app.controller 'PageCreateCtrl', [
  '$scope', 'Page', '$location'
  ($scope, Page, $location) ->

    $scope.save = ->
      Page.save $scope.page, (page) ->
        $location.path('/pages/' + page._id.$oid);

]

