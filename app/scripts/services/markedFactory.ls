'use strict';

angular.module 'markedFactory', []
  .factory 'markedFactory', <[$window]> ++ ($window) -> {
    marked: $window.marked
  }
