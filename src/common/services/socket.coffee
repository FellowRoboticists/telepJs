"use strict"

angular

  .module( "app.services" )

  .factory( "socket", ($rootScope) ->

    a = 1
    #socket = io.sails.connect()

    #on: (eventName, callback) ->
      #socket.on(eventName, ->
        #args = arguments
        #$rootScope.$apply( ->
          #callback.apply(socket, args)
        #)
      #)

    #emit: (eventName, data, callback) ->
      #socket.emit(eventName, data, ->
        #args = arguments
        #$rootScope.$apply( ->
          #if callback
            #callback.apply(socket, args)
        #)
      #)
  )
