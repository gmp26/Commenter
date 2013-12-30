'use strict'

describe 'Directive: mathWatch', (_) ->

  # load the directive's module
  beforeEach module 'mathWatch'

  var $rootScope
  var $scope
  var $compile
  var $timeout
  var $window

  beforeEach inject (_$compile_, _$rootScope_, _$timeout_, _$window_) ->
    $rootScope := _$rootScope_
    $scope := $rootScope.$new!
    $compile := _$compile_
    $timeout := _$timeout_
    $window := _$window_

    $scope.rendered = false

    # Supply a mock MathJAX Hub and Queue function
    $window.MathJax = do
      Hub:
        Queue: -> $scope.rendered = true

  it 'should trigger a mathJax render when watched value changes', (_) ->
    $scope.renderCount = 0
    $scope.watched = "foo"

    # start the directive up, watching $scope.watched
    element = angular.element '<div math-watch="watched"></div>'
    element = $compile(element) $scope

    # change it's value and feed scope to angular
    $scope.watched = "bar"
    $scope.$digest!

    # time passes
    $timeout.flush!

    expect $scope.rendered .toBe true
