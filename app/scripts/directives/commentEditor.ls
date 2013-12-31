'use strict';

angular.module 'commentEditorDirective' []
  .directive 'commentEditor', <[]> ++ ->
    controller: 'commentEditorCtrl'
    templateUrl: 'views/commentEditor.html'
    replace: true
    restrict: 'EA'
