'use strict';

angular.module 'mdHelpDirective' []
  .directive 'mdHelp', <[]> ++ ->
    templateUrl: 'views/mdHelp.html'
    restrict: 'EA'
    replace: true
