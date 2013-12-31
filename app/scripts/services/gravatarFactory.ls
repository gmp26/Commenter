'use strict';

trim = (s) -> s.replace(/^\s+/, '').replace(/\s+$/, '')

angular.module 'gravatarFactory' []
  .factory 'gravatarFactory', <[md5]> ++ (md5)-> do

    # return Url of a gravatar, with a default if user has none
    gravatarUrl: (email, d = 'retro') ->

      gravatarSite = "http://www.gravatar.com/avatar/"
      
      # console.log trim email

      hash = md5.createHash(trim email)
 
      "#{gravatarSite}#{hash}?d=#{d}"

