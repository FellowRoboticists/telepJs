"use strict"

angular

  .module( "app.services" )

  .provider( "debug", ->

    url = "/error_log"

    setApiUrl: (url) ->
      url = url

    $get: ($http, $location, $log, deviceDetector, SessionFactory) ->

      #
      # Capture snapshot
      getSnapshot: (error, data={}) ->
        snapshot = {}
        try
          angular.extend(snapshot,
            error: JSON.parse( JSON.stringify( JSON.decycle(error) ) )
            data: JSON.parse( JSON.stringify( JSON.decycle(data) ) )
            path: $location.url()
            session: SessionFactory.toJSON()
            browser: deviceDetector.browser
            browser_version: deviceDetector.browser_version
            os: deviceDetector.os
            os_version: deviceDetector.os_version
            device: deviceDetector.device
            userAgent: deviceDetector.raw.userAgent
          )
        catch error
          $log.debug error
        finally
          snapshot

      #
      # Send snapshot
      send: (error, data={}) ->
        $log.debug message
  )
