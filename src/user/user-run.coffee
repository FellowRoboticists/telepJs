"use strict"

angular

  .module( "app.user" )

  .run( ( $log, $state, NotificationsFactory, SessionFactory, AuthService, socket, _, debug ) ->

    $log.debug "This is where we would start listening for socket stuff"
    #
    # Page range download complete
    #socket.on("user:download_complete", (download) ->
      #return false unless SessionFactory.sessionId?
      #$log.debug "Page range download blast: #{download.id}"
      #if SessionFactory.user.id is download.user
        #downloadCounter.bump()
        #NotificationsFactory.info("&ldquo;#{download.downloadTitle}&rdquo; is ready! You may <b><a href='/user/#{download.user}/pagedownload/#{download.id}'>download it now</a></b> or later from the <b><a href='#/downloads'>Downloads Page</a></b>.")
    #)

    #
    # Log out user if session terminated
    #socket.on("user:logged_out", (sessionsObj) ->
      #return false unless SessionFactory.sessionId?
      #$log.debug "Logout blast: #{JSON.stringify(sessionsObj)}"
      #if !!sessionsObj.numSessions and _.contains(sessionsObj.sessions, SessionFactory.sessionId)
        #debug.send("user:logged_out",{error:"user:logged_out"})
        #AuthService.logout().then( (response) ->
          #NotificationsFactory.warningAfterTransition("Someone signed in with your email and password at another location so your session has been terminated. Contact <b><a href='mailto:support@bighornimaging.com'>support@bighornimaging.com</a></b> if you think this is in error.")
          #$state.go("app.login")
        #)
    #)

    #
    # Log out user if profile is locked
    #socket.on("user:locked", (userId) ->
      #return false unless SessionFactory.sessionId?
      #$log.debug "User lock blast: #{userId}"
      #if SessionFactory.user.id is userId
        #AuthService.logout().then( (response) ->
          #NotificationsFactory.warningAfterTransition("Your <em>profile</em> has been locked. Contact <b><a href='mailto:support@bighornimaging.com?subject=Why is my profile locked?'>support@bighornimaging.com</a></b> if you think this is in error.")
          #$state.go("app.login")
        #)
    #)

  )
