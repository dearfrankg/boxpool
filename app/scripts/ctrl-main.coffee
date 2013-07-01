'use strict'

angular.module('boxpoolApp')
  .controller('AppCtrl', [
    '$scope', '$location', 'Page', '$cookies', 'PASSWORD',
    ($scope, $location, Page, $cookies, PASSWORD) ->

      $scope.active = (path) ->
        active = path == $location.path()
        return active;

      $scope.login = ->
        $scope.admin = $scope.page.username is 'kristal' and $scope.page.password is PASSWORD
        if $scope.admin 
          $cookies.admin = 'admin'
          $scope.flash = ''
          $location.path('#/')
        else 
          $cookies.admin = ''
          $scope.flash = 'Invalid Login'

      $scope.logout = ->
        $cookies.admin = ''
        $scope.admin = !!$cookies.admin
        $location.path('#/')

      $scope.admin = $cookies.admin

  ])
  .controller('MainCtrl', [
    '$scope', '$location', 'Page', '$cookies', 'PASSWORD',
    ($scope, $location, Page, $cookies, PASSWORD) ->


      $scope.updateHome = ->
        Page.query(
          {name: 'home'}
          (page) ->
            $scope.page = page[0]
        )

      $scope.updateHome()


  ])
