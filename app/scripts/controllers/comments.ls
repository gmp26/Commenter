'use strict'

{find} = require 'prelude-ls'

angular.module 'commentsApp'
  .controller 'CommentsCtrl', <[
    $scope 
    $routeParams
    gravatarFactory
    userFactory
    currentCommentFactory
  ]> ++ ($scope, $routeParams, gravatarFactory, userFactory, currentCommentFactory) ->

    # console.log "CommentsCtrl: #{$routeParams.rid} "

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
    
    # start a reply to a comment
    $scope.reply = (resourceId, commentId) ->
      console.log "editing #{resourceId},#{commentId}"
      currentCommentFactory.data resourceId commentId

    # Calculate gravatar urls
    addGravatars = (resources, retro='retro') ->
      for resource in resources
        for comment in resource.comments
          comment.gravatar = gravatarFactory.gravatarUrl comment.email, retro

    addGravatars $scope.resources

    getResource = (resourceId) ->
      find (.id == resourceId), $scope.resources

    resource = $scope.resource = getResource $routeParams.rid

    # start to add a comment
    $scope.addComment = ->
      user = userFactory.user
      resource.posts += 1
      resource.comments[*] = do
        id: resourceId
        user: user.id
        email: user.email
      currentCommentFactory.data resourceId resource.comments.length

      # redirect to comment edit form    

    # post a comment
    $scope.postComment = (title, body) ->
      user = userFactory.user
      resource.posts += 1
      resource.comments[*] = do
        id: resourceId
        user: user.id
        email: user.email
        title: title
        body: body

