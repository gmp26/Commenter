'use strict'

angular.module 'commentsApp'
  .controller 'CommentCtrl', <[$scope markedFactory $sce]> ++ ($scope, markedFactory, $sce) ->

    comment = $scope.comment = {}

    $scope.aceLoaded = (_editor) ->

      console.log "ACE loaded"

      marked = markedFactory.marked
      marked.setOptions do
        gfm: true
        tables: true,
        breaks: true,
        pedantic: false,
        sanitize: true,
        smartLists: true,
        smartypants: true,

      # Editor part
      _session = _editor.getSession!
      _renderer = _editor.renderer

      # Options
      _editor.setReadOnly true
      _session.setUndoManager new ace.UndoManager!
      _renderer.setShowGutter false

      _editor.gotoLine(10);

      # Events
      _editor.on "changeSession", ->
        console.log "editor.on changeSession event"

      $scope.render = ->
        $scope.preview =  $sce.trustAsHtml marked _editor.getValue!
      $scope.render!

      _session.on "change", -> $scope.render!

    $scope.aceChanged = (e) ->
      console.log "ACE changed"
      console.debug e
