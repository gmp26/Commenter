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
  commentEditorController
  commentEditorDirective
  mdHelpDirective
]>
.config <[$routeProvider]> ++ ($routeProvider) ->
  $routeProvider.when '/', {
    templateUrl: 'views/home.html'
    controller: 'commentEditorCtrl'
  }
  .when '/resource/:rid/comments', {
    templateUrl: 'views/comments.html'
    controller: 'CommentsCtrl'
  }
  .otherwise {
    redirectTo: '/'
  }
