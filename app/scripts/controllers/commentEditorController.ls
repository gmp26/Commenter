'use strict'

angular.module 'commentEditorController' []
  .controller 'commentEditorCtrl', <[$scope markedFactory $sce md5]> ++ ($scope, markedFactory, $sce, md5) ->

    comment = $scope.comment = {title: "Enter comment title"}
    $scope.comment.body = ""

    $scope.showHelp = false

    # watch the comment text entry and update the preview
    $scope.$watch 'comment.body', ->
      sanitizedHtml = marked comment.body
      .replace /<table>/, '<table class="table table-striped table-hover">'
      $scope.preview =  $sce.trustAsHtml sanitizedHtml
