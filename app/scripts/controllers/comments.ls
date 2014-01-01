'use strict'

{find, is-type} = require 'prelude-ls'

angular.module 'commentsApp'
  .controller 'CommentsCtrl', <[
    $scope 
    $routeParams
    gravatarFactory
    userFactory
  ]> ++ ($scope, $routeParams, gravatarFactory, userFactory) ->

    # console.log "CommentsCtrl: #{$routeParams.rid} "

    # Initialise resources first time only
    $scope.resources ?= {}

    # initially we are not editing any resource, comment, or reply
    $scope.resource = null
    $scope.newComment = null
    $scope.reply = null

    # find any resource passed in
    rid = $routeParams.rid
    resource = find (.id == $routeParams.rid), $scope.resources

    # add a new comment
    $scope.addComment = ->
      user = userFactory.user!
      $scope.newComment = do
        user: user.id
        email: user.email
        gravatar: gravatarFactory.gravatarUrl user.email
        body: ''
        title: ''
        votes: 0

    # create a new resource and a new comment if we can't find the given id
    if !resource and rid and is-type('String', rid)
      resource = do
        id: rid
        posts: 0
        comments: []

      $scope.resources[*] = resource
      # $scope.addComment!

    $scope.resource = resource

    # TODO: Read in resources from server

    # Update gravatar urls for current resource
    addGravatars = (retro='retro') ->
      if $scope.resource?.comments?
        for c in $scope.resource.comments
          c.gravatar = gravatarFactory.gravatarUrl c.email, retro

    addGravatars $scope.resources

    $scope.voteUp = (comment) ->
      ++comment.votes



