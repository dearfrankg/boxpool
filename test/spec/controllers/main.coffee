'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'boxpoolApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($rootScope, $controller) ->
    scope = $rootScope.$new()


  it 'should handle simple test', () ->
    expect(true).toBe(true)