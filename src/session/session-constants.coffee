"use strict"

angular

  .module( "app.session" )

  .constant( "SESSION_TPL",
    "sessionId": null
    "user":
      "id": null
      "email": null
      "name": null
      "permissions":
        "manageUsers": false
        "curateBooks": false
      "locked": false
      "termsAccepted": false
      "isCurrentUser": true
      "accountOwner": false
      "contractor": false
    "account":
      "id": null
      "accountType": null
      "name": null
      "locked": false
      "projectsEnabled": false
      "bookViewPrice": null
      "pageViewPrice": null
      "pagePdfPrice": null
  )
