'use strict'

# http://www.gravatar.com/avatar/0000240000aa00000000900800000113?d=retro&s=40

{find} = require 'prelude-ls'

angular.module 'commentsApp'
  .controller 'CommentsCtrl', <[
    $scope 
    $routeParams
    gravatarFactory
  ]> ++ ($scope, $routeParams, gravatarFactory) ->

    console.log "CommentsCtrl: #{$routeParams.rid} "

    #
    # Mock up some resource comments
    #
    $scope.resources =
      * id: "NA3_RT1"
        posts: 2
        comments: 
          * id: "1"
            user: "mike0"
            email: "gmp26test@gmail.com"
            title: "RT1 comment 1 title"
            body: "RT1 comment 1 body"
          * id: "2"
            user: "gmp26"
            email: "gmp26@cam.ac.uk"
            title: "RT1 comment 2 title"
            body: "RT1 comment 2 body"
      * id: "NA3_RT2"
        posts: 1
        comments:
          * id: "1"
            user: "mike1"
            email: "gmp26@hermes.cam.ac.uk"
            title: "RT2 comment 1 title"
            body: "RT2 comment 1 body"
          ...
    
    getResource = (resourceId) ->
      find (.id == resourceId), $scope.resources

    resource = $scope.resource = getResource $routeParams.rid

    $scope.addComment = (user, title, body) ->
      resource.comments[*] = {
        id: resourceId
        posts: ++resource.posts
        comments: []
      }

