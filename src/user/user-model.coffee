"use strict"

angular

  .module( "app.user" )

  .service( "User", (RailsResource, railsSerializer, SessionFactory) ->

    class User extends RailsResource

      currentUserId = null

      @configure
        url: "/user"
        name: "user"
        serializer: railsSerializer( ->
          @exclude(
            "$$selected",
            "isCurrentUser"
          )
        )
        interceptors: [
          afterResponse: (result)->
            currentUserId = SessionFactory.user.id
            if angular.isArray result
              item._prepare?() for item in result
            else
              result._prepare?()
        ]

      _prepare: ->
        @isCurrentUser = @id is currentUserId
        @

      @resetTerms: ->
        @$post( "/user/reset_terms" )

      projects: ->
        User.$get( @$url("/project") )
  )
