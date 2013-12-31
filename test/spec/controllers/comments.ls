'use strict'

describe 'Controller: CommentsCtrl', (_) ->

  # load the controller's module
  beforeEach module 'commentsApp'

  CommentsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope := $rootScope.$new()
    scope.resources =
      * id: "NA3_RT1"
        posts: 2
        comments: 
          * id: "1"
            user: "mike0"
            email: "gmp26test@gmail.com"
            title: "RT1 comment 1 title"
            body: "RT1 comment 1 body"
            votes: 100
          * id: "2"
            user: "gmp26"
            email: "gmp26@cam.ac.uk"
            title: "RT1 comment 2 title"
            body: "RT1 comment 2 body"
            votes: 2
      * id: "NA3_RT2"
        posts: 1
        comments:
          * id: "1"
            user: "mike1"
            email: "gmp26@hermes.cam.ac.uk"
            title: "RT2 comment 1 title"
            body: "RT2 comment 1 body"
            votes: 489
          ...

    CommentsCtrl := $controller 'CommentsCtrl', {
      $scope: scope
    }

  it 'should start with 2 posts on NA3_RT1 and 1 on NA3_RT2', ->
    expect scope.resources.0.id .toBe "NA3_RT1"
    expect scope.resources.0.posts .toBe 2
    expect scope.resources.1.id .toBe "NA3_RT2"
    expect scope.resources.1.posts .toBe 1


    