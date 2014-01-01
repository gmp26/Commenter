'use strict'

describe 'Service: mockWebServer', (_) ->

  # load the service's module
  beforeEach module 'mockWebServer'

  # instantiate service
  mockWebServer = {}
  beforeEach inject (_mockWebServer_) ->
    mockWebServer := _mockWebServer_

  it 'should do something', ->
    expect(!!mockWebServer).toBe true
