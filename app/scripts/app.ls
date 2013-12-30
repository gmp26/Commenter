'use strict'

angular.module 'commentsApp', <[
  ngRoute 
  ngAnimate 
  templates 
  ui.ace 
  ngMd5 
  miniEditDirective 
  mathWatch
]>
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
    controller: 'CommentCtrl'
  }
  .otherwise {
    redirectTo: '/'
  }
