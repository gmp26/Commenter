'use strict'

angular.module 'commentsApp', <[ngRoute ui.ace]>
  .config <[$routeProvider]> ++ ($routeProvider) ->
    $routeProvider.when '/', {
      templateUrl: 'views/main.html'
      controller: 'MainCtrl'
    }
    .when '/resource/:rid/comments', {
      templateUrl: 'views/comments.html'
      controller: 'CommentsCtrl'
    }
    .when '/comment', {
      templateUrl: 'views/comment.html'
    }
    .otherwise {
      redirectTo: '/'
    }