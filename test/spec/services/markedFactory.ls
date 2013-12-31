'use strict'

describe 'Service: markedFactory', (_) ->

  # load the service's module
  beforeEach module 'markedFactory'

  # instantiate service
  var markedFactory
  
  beforeEach inject (_markedFactory_) ->
    markedFactory := _markedFactory_

  it 'should exist', ->
    expect(!!markedFactory).toBe true

  it 'should convert markdown', ->
    marked = markedFactory.marked
    expect(marked).toBeDefined!
    expect((marked "\#title").replace '\n', '').toBe '<h1 id="title">title</h1>'
