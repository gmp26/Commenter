'use strict'

describe 'Service: currentCommentFactory', (_) ->

  # load the service's module
  beforeEach module 'currentCommentFactory'

  # instantiate service
  var currentCommentFactory
  var data

  beforeEach inject (_currentCommentFactory_) ->
    currentCommentFactory := _currentCommentFactory_
    data := currentCommentFactory.data

  it 'should have a data function', ->
    expect(typeof data).toBe 'function'

  describe 'set and get current comment data', (_) ->

    beforeEach ->
      data 'NA3_RT1', 2

    it 'should retrieve the current comment data', (_) ->
      d = data!
      expect(d.resourceId) .toBe 'NA3_RT1'
      expect(d.commentId) .toBe 2
