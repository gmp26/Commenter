'use strict'

describe 'Controller: commentEditorCtrl', (_) ->

  # load the controller's module
  beforeEach module 'commentEditorController'

  commentEditorCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope := $rootScope.$new()
    commentEditorCtrl := $controller 'commentEditorCtrl', {
      $scope: scope
    }

  xit 'should attach a list of awesomeThings to the scope', ->
    expect scope.awesomeThings.length .toBe 7
