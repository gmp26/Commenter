'use strict'

angular.module 'commentsApp', <[
  ngRoute 
  ngAnimate
  ngSanitize
  ngMockE2E
  templates 
  ngMd5 
  mathWatch
  gravatarFactory
  userFactory
  commentEditorController
  commentEditorDirective
  mdHelpDirective
  markedFactory
  mockWebServer
]>
.config <[$routeProvider]> ++ ($routeProvider) ->
  $routeProvider.when '/', {
    templateUrl: 'views/home.html'
    controller: 'commentEditorCtrl'
  }
  .when '/comments/:rid', {
    templateUrl: 'views/comments.html'
    controller: 'CommentsCtrl'
  }
  .otherwise {
    redirectTo: '/'
  }
.run <[mockWebServer]> ++ (mockWebServer) ->
  mockWebServer.run!

