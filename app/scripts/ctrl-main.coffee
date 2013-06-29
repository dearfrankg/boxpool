'use strict'

angular.module('boxpoolApp')
  .controller 'MainCtrl', [
    '$scope', '$location', 'Page', '$cookies', 'PASSWORD',
    ($scope, $location, Page, $cookies, PASSWORD) ->


      Page.query(
        {name: 'home'}
        (page) ->
          $scope.page = page[0]
      )

      $scope.active = (path) ->
        active = path == $location.path()
        return active;


      $scope.login = (path) ->
        $scope.admin = $scope.page.username is 'kristal' and $scope.page.password is PASSWORD
        if $scope.admin 
          $cookies.admin = 'admin'
          $scope.flash = ''
          $location.path('#/')
        else 
          $cookies.admin = ''
          $scope.flash = 'Invalid Login'



      $scope.logout = (path) ->
        $cookies.admin = ''
        $scope.admin = !!$cookies.admin


      $scope.admin = $cookies.admin

  ]
