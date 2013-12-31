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

  comment = $scope.comment = {title: "Title", body: ""}
  $scope.title = "Title"
  $scope.preview = ""

  $scope.showHelp = false

  # watch the comment title input and update the active title
  $scope.$watch 'comment.title', ->
    sanitizedHtml = $sanitize comment.title
    $scope.title = $sce.trustAsHtml sanitizedHtml

  # watch the comment text entry and update the preview
  $scope.$watch 'comment.body', ->
    # use the sanitizer built into marked
    sanitizedHtml = marked comment.body 
    .replace /<table>/, '<table class="table table-striped table-hover">'
    $scope.preview =  $sce.trustAsHtml sanitizedHtml

  $scope.cancel = ->
    $scope.c.editing = false
    $scope.resources.editing = false

  $scope.post = ->
    console.debug $scope
    if $scope.addForm.$valid
      $scope.c.title = $scope.title
      $scope.c.body = $scope.preview
      $scope.c.editing = false
      $scope.resources.editing = false
    else
      console.log 'invalid'
