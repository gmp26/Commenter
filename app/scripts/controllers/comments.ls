'use strict'

{find, is-type} = require 'prelude-ls'

angular.module 'commentsApp'
  .controller 'CommentsCtrl', <[
    $scope 
    $routeParams
    gravatarFactory
    userFactory
    $http
    $log
  ]> ++ ($scope, $routeParams, gravatarFactory, userFactory, $http, $log) ->

    # console.log "CommentsCtrl: #{$routeParams.rid} "

    # Initialise resources first time only
    $scope.resources ?= {}

    # initially we are not editing any resource, comment, or reply
    $scope.resource = null
    $scope.newComment = null
    $scope.reply = null


    rid = $routeParams.rid
    ridOK = rid and is-type('String', rid)
    if ridOK
      $http.get "/v1/comments/#{rid}"
      .then loadResource, loadError

    function loadError(response)
      $log.error "bad response"
      console.debug response

    function loadResource(response)

      $log.info "resource #{rid} data:"
      $log.info JSON.stringify response.data

      resource = response.data

      # create a new resource and a new comment if we can't find the given id
      if !resource
        resource = do
          id: rid
          posts: 0
          comments: []
        $scope.resources[*] = resource

      # Update gravatar urls for current resource
      if resource?.comments?
        for c in resource.comments
          c.gravatar = gravatarFactory.gravatarUrl c.email, 'retro'

      $scope.resource = resource

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

    $scope.voteUp = (comment) ->
      ++comment.votes



