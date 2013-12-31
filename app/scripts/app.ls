'use strict'

angular.module 'commentsApp', <[
  ngRoute 
  ngAnimate 
  templates 
  ui.ace 
  ngMd5 
  mathWatch
  gravatarFactory
  userFactory
  currentCommentFactory
]>
.config <[$routeProvider]> ++ ($routeProvider) ->
  $routeProvider.when '/editor', {
    templateUrl: 'views/main.html'
    controller: 'MainCtrl'
  }
  .when '/resource/:rid/comments', {
    templateUrl: 'views/comments.html'
    controller: 'CommentsCtrl'
  }
  .when '/editor', {
    templateUrl: 'views/editor.html'
    controller: 'CommentCtrl'
  }
  .otherwise {
    redirectTo: '/editor'
  }
