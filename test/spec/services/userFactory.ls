'use strict'

describe 'Service: userFactory', (_) ->

  # load the service's module
  beforeEach module 'userFactory'

  # instantiate service
  var userFactory
  var user

  beforeEach inject (_userFactory_) ->
    userFactory := _userFactory_
    user := userFactory.user!

  it 'should return email', ->
    expect(user.email).toBe 'gmp26@cam.ac.uk'

  it 'should return userid', ->
    expect(user.id).toBe 'gmp26'
