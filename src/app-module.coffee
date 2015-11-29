"use strict"

angular.module( "templates", [])

angular

  .module( "app", [

    "templates",
    "cfp.hotkeys",
    "angularUtils.directives.dirPagination",
    "rails",
    "ui.router",
    "ui.bootstrap",
    "ngMessages",
    #"ngAnimate",
    "naturalSort",
    "ng.deviceDetector",

    "app.session",
    "app.auth",
    "app.constants",
    "app.filters",
    "app.components",
    "app.directives",
    "app.services",
    "app.notifications",
    "app.errors",
    "app.login",
    # "app.terms",
    # "app.privacy",
    "app.user",
    "app.robot"
    # "app.download",
    # "app.account",
    # "app.accountType",
    # "app.profile",
    # "app.project",
    # "app.book",
    # "app.page"
  ])
