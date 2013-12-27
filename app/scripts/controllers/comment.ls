'use strict'

angular.module 'commentsApp'
  .controller 'CommentCtrl', <[$scope]> ++ ($scope) ->

    comment = $scope.comment = {}

    $scope.aceLoaded = (_editor) ->

      # Editor part
      _session = _editor.getSession!
      _renderer = _editor.renderer

      # Options
      _editor.setReadOnly(true);
      _session.setUndoManager(new ace.UndoManager());
      _renderer.setShowGutter(false);

      # Events
      _editor.on "changeSession", ->
        console.log "editor.on changeSession event"

      _session.on "change", ->
        console.log "session.on change event"

    $scope.aceChanged = (e) ->
      #
