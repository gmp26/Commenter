'use strict';

{find} = require 'prelude-ls'

angular.module 'mockWebServer' []
  .factory 'mockWebServer', <[$httpBackend $log]> ++ ($httpBackend, $log) ->

    # mock up some db content here
    resources =
      * id: "http:cmep.mathsorgswanageNA3_RT1indexhtml"
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

    # Define mock XHR API
    do
      run: ->
        for resource in resources
          $httpBackend.whenGET "/v1/comments/#{resource.id}" 
          .respond resource

          # addComment 
          $httpBackend.whenPUT "/v1/comments/#{resource.id}"
          .respond (method, url, comment) ->
            rid = url.substr url.lastIndexOf('/')+1
            resource = find (.id == rid), resources
            if resource
              console.log "adding to resource"
              resource.comments[*] = JSON.parse comment
              resource.posts = resource.comments.length
              console.debug resource
              return [200, "success"]
            else
              return [404, "not found"]
