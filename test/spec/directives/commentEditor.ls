'use strict'

describe 'Directive: commentEditor', (_) ->

  # load the modules we need
  beforeEach module 'commentEditorController'
  beforeEach module 'commentEditorDirective'
  beforeEach module 'markedFactory'
  beforeEach module 'ngMd5'
  beforeEach module 'templates'
  beforeEach module 'ngSanitize'
  beforeEach module 'userFactory'

  var $rootScope
  var $scope
  var $compile

  beforeEach inject (_$compile_, _$rootScope_) ->
    $rootScope := _$rootScope_
    $scope := $rootScope.$new!
    $compile := _$compile_

  it 'should replace content with comment editor html', ->
    element = angular.element '<div><comment-editor></comment-editor></div>'
    element = $compile(element) $scope
    $rootScope.$digest!
    expect element.0.innerHTML .toMatch /<div class="comment-editor">/
