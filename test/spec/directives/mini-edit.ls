'use strict'

describe 'Directive: miniEdit', (_) ->

  # load the directive's module
  beforeEach module 'miniEditDirective'

  var $rootScope
  var $scope
  var $compile

  beforeEach inject (_$compile_, _$rootScope_) ->
    $rootScope := _$rootScope_
    $scope := $rootScope.$new!
    $compile := _$compile_

  it 'should make hidden element visible', ->
    element = angular.element '<mini-edit></mini-edit>'
    element = $compile(element) $scope
    expect element.text! .toBe 'this is the miniEdit directive'
