'use strict'

describe 'Service: gravatarFactory', (_) ->

  # load modules
  beforeEach module 'angular-md5'
  beforeEach module 'gravatarFactory'

  # instantiate service
  gravatarFactory = {}

  beforeEach inject (_gravatarFactory_) ->
    gravatarFactory := _gravatarFactory_

  it 'should convert an email to a gravatar url', (_) ->
    expect(gravatarFactory.gravatarUrl 'gmp26@cam.ac.uk')
    .toBe "http://www.gravatar.com/avatar/7d50863de4f9b22f19c71b501f09ff86?d=retro"

  it 'should trim email before conversion', (_) ->
    expect(gravatarFactory.gravatarUrl ' gmp26@cam.ac.uk \t\n')
    .toBe "http://www.gravatar.com/avatar/7d50863de4f9b22f19c71b501f09ff86?d=retro"

  it 'should accept alternative default', (_) ->
    expect(gravatarFactory.gravatarUrl 'gmp26@cam.ac.uk' 'identicon')
    .toBe "http://www.gravatar.com/avatar/7d50863de4f9b22f19c71b501f09ff86?d=identicon"
