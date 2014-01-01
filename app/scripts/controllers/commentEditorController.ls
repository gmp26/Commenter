'use strict'

angular.module 'commentEditorController' []
.controller 'commentEditorCtrl', <[
  $scope 
  markedFactory 
  $sce
  md5
  $sanitize
  userFactory
]> ++ ($scope, markedFactory, $sce, md5, $sanitize, userFactory) ->

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
      c.title = $scope.title ? ""
      c.body = $scope.preview ? ""
      $scope.newComment = null
      $scope.resource.posts++
    else
      console.log 'invalid'
