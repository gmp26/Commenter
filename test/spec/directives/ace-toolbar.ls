'use strict'

describe 'Directive: aceToolbar', (_) ->

  # load the directive's module
  beforeEach module 'commentsApp'

  var $rootScope
  var $scope
  var $compile

  beforeEach inject (_$compile_, _$rootScope_) ->
    $rootScope := _$rootScope_
    $scope := $rootScope.$new!
    $compile := _$compile_

  it 'should make hidden element visible', ->
    html = '<div class="btn-group">
  <button class="btn">h1</button>
  <button class="btn">h2</button>
  <button class="btn">h3</button>
  <button class="btn">h4</button>
  <button class="btn">h5</button>
  <button class="btn">b</button>
  <button class="btn">i</button>
  </div>'
    element = angular.element '<ace-toolbar></ace-toolbar>'
    element = $compile(element) $scope
    expect element.html! .toBe html
