'use strict'

describe 'Directive: mdHelp', (_) ->

  # load the templateCache
  beforeEach module 'templates'

  # load the directive's module
  beforeEach module 'mdHelpDirective'

  var $rootScope
  var $scope
  var $compile

  beforeEach inject (_$compile_, _$rootScope_) ->
    $rootScope := _$rootScope_
    $scope := $rootScope.$new!
    $compile := _$compile_

  it 'should replace content with markdown help', ->
    element = angular.element '<div><md-help></md-help></div>'
    element = $compile(element) $scope
    $rootScope.$digest!
    expect element.0.innerHTML .toMatch /<div class="md-help">/
