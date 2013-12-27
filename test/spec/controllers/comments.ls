'use strict'

describe 'Controller: CommentsCtrl', (_) ->

  # load the controller's module
  beforeEach module 'commentsApp'

  CommentsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope := $rootScope.$new()
    CommentsCtrl := $controller 'CommentsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect scope.awesomeThings.length .toBe 7
