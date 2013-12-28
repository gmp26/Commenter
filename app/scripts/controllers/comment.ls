'use strict'

angular.module 'commentsApp'
  .controller 'CommentCtrl', <[$scope markedFactory $sce md5]> ++ ($scope, markedFactory, $sce, md5) ->

    comment = $scope.comment = {}

    $scope.gravatar = "http://www.gravatar.com/avatar/#{md5.createHash('gmp26@cam.ac.uk')}"

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
        sanitizedHtml = marked _editor.getValue!
        .replace /<table>/, '<table class="table table-striped table-hover">'

        $scope.preview =  $sce.trustAsHtml sanitizedHtml

      $scope.render!

      _session.on "change", -> $scope.render!

    $scope.aceChanged = (e) ->
      console.log "ACE changed"
      console.debug e
