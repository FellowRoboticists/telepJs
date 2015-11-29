"use strict"

angular

  .module( "app.session" )

  .factory( "SessionFactory", ( $q, $log, locker, SESSION_TPL ) ->

    vm = @

    #
    # Get cached session on page reload
    angular.extend( vm, locker.get("session", SESSION_TPL) )

    #
    # Set session
    vm.set = (sessionData) ->
      session = @
      $q( (resolve) ->
        # Extend factory with new session object
        newSession = angular.extend( session, SESSION_TPL, sessionData )
        # Cache new session in storage
        locker.put("session", newSession)
        $log.debug("Create session: #{JSON.stringify(session)}")
        resolve(session)
      )

    #
    # Destroy session
    vm.destroy = ->
      session = @
      $q( (resolve) ->
        # Extend factory with blank session object
        newSession = angular.extend( session, SESSION_TPL )
        # Cache blank session in storage
        locker.put("session", newSession )
        $log.debug("Destroy session: #{JSON.stringify(session)}")
        resolve(session)
      )

    #
    # Enforce schema
    vm.toJSON = ->
      "sessionId": @sessionId
      "user":
        "id": @user.id
        "email": @user.email
        "name": @user.name
        "permissions":
          "manageUsers": @user.permissions.manageUsers
          "curateBooks": @user.permissions.curateBooks
        "locked": @user.locked
        "termsAccepted": @user.termsAccepted
        "isCurrentUser": true
        "accountOwner": @user.accountOwner
        "contractor": @user.contractor
      "account":
        "id": @account.id
        "accountType": @account.accountType
        "name": @account.name
        "locked": @account.locked
        "projectsEnabled": @account.projectsEnabled
        "bookViewPrice": @account.bookViewPrice
        "pageViewPrice": @account.pageViewPrice
        "pagePdfPrice": @account.pagePdfPrice
        "pageDownloadPrice": @account.pageDownloadPrice

    return vm
  )
