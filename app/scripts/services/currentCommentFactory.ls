'use strict';

angular.module 'currentCommentFactory' []
  .factory 'currentCommentFactory', <[]> ++ -> 

    var resourceId
    var commentId

    do
      data: (rid, cid) ->
        if rid? and cid?
          resourceId := rid
          commentId := cid
        {resourceId: resourceId, commentId: commentId}

