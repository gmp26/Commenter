'use strict'

angular.module 'commentsApp', <[
  ngRoute 
  ngAnimate
  ngSanitize
  templates 
  ngMd5 
  mathWatch
  gravatarFactory
  userFactory
  commentEditorController
  commentEditorDirective
  mdHelpDirective
  markedFactory
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
