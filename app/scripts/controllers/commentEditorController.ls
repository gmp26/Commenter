'use strict'

angular.module 'commentEditorController' []
.controller 'commentEditorCtrl', <[
  $scope 
  markedFactory 
  $sce
  md5
  $sanitize
  userFactory
  $http
  $log
]> ++ ($scope, markedFactory, $sce, md5, $sanitize, userFactory, $http, $log) ->

  user = userFactory.user!

  $scope.newComment
  $scope.title = ""
  $scope.preview = ""

  $scope.showHelp = false

  # watch the comment title input and update the active title
  $scope.$watch 'newComment.title', ->
    sanitizedHtml = if $scope.newComment?.title
      $sanitize $scope.newComment.title
    else ''
    $scope.title = $sce.trustAsHtml sanitizedHtml

  # watch the comment text entry and update the preview
  $scope.$watch 'newComment.body', ->
    # use the sanitizer built into marked
    sanitizedHtml = if $scope.newComment?.body
      marked $scope.newComment.body
      .replace /<table>/, '<table class="table table-striped table-hover">'
    else
      '' 
    $scope.preview =  $sce.trustAsHtml sanitizedHtml

  $scope.cancel = ->
    $scope.newComment = null

  $scope.post = ->
    if $scope.addForm.$valid
      c = $scope.resource.comments[*] = $scope.newComment

      if c.title
        $scope.title = c.title
        c.title.toJSON = -> $sce.getTrustedHtml c.title
      else
        $scope.title = ""

      if c.body
        $scope.body = c.body
        c.body.toJSON = -> $sce.getTrustedHtml c.body
      else
        $scope.body = ""

      $scope.resource.posts++

      jsonComment = angular.toJson $scope.newComment
      $http.put "/v1/comments/#{$scope.resource.id}", jsonComment
      .success (response) ->
        console.debug response
        $log.info "status #{response}"
      .error ->
        $log.error "status #{response}"
        console.debug response
      $scope.newComment = null
    else
      $log.error 'invalid form: should not happen'
