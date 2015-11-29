"use strict"

angular

  .module( "app.auth" )

  .service( "AuthService", ( $rootScope, $http, SessionFactory ) ->

    login: (credentials) ->
      $http
        .post( "/session", credentials )
        .then( (response) ->
          $rootScope.$emit("user:login", response.data)
          SessionFactory.set(response.data)
        )

    logout: ->
      $http
        .delete( "/session" )
        .finally( ->
          $rootScope.$emit("user:logout", SessionFactory)
          SessionFactory.destroy()
        )

  )
