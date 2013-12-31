'use strict';

angular.module 'replyEditorDirective' []
  .directive 'replyEditor', <[]> ++ ->
    controller: 'replyEditorCtrl'
    templateUrl: 'views/replyEditor.html'
    replace: true
    restrict: 'EA'
