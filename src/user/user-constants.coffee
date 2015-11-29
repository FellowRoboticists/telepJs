"use strict"

angular

  .module( "app.user" )

  .constant( "USER_TPL",
    "id": null
    "account": null
    "accountOwner": false
    "contractor": false
    "email": null
    "name": null
    "locked": false
    "termsAccepted": false
    "permissions":
      "manageUsers": false
      "curateBooks": false
  )
