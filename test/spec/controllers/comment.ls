'use strict'

describe 'Controller: CommentCtrl', (_) ->

  # load the controller's module
  beforeEach module 'commentsApp'

  CommentCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope := $rootScope.$new()
    CommentCtrl := $controller 'CommentCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect scope.awesomeThings.length .toBe 7
