'use strict'

angular.module('boxpoolApp')
  .controller 'MainCtrl', ['$scope', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ]
  ]
