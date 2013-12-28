'use strict';

angular.module 'commentsApp'
  .directive 'aceToolbar', ->
    template: '<div class="btn-group">
    <button class="btn">h1</button>
    <button class="btn">h2</button>
    <button class="btn">h3</button>
    <button class="btn">h4</button>
    <button class="btn">h5</button>
    <button class="btn"><b>b</b></button>
    <button class="btn"><i>i</i></button>
    </div>'
    restrict: 'EA'
