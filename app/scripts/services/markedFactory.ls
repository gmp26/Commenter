'use strict';

angular.module('commentsApp').factory 'markedFactory', <[$window]> ++ ($window) -> {
  marked: $window.marked
}
