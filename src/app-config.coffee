"use strict"

angular

  .module( "app" )

  .config( ($httpProvider, $urlRouterProvider, $stateProvider, $compileProvider, RailsResourceProvider, railsSerializerProvider) ->

    #
    # Resource model configs
    railsSerializerProvider
      .underscore(angular.identity)
      .camelize(angular.identity)
    RailsResourceProvider
      .rootWrapping(false)
      .underscoreParams(false)

    #
    # App root state
    $stateProvider
      .state(
        name: "AnonLayout"
        templateUrl: "anon-layout.html"
      )
      .state(
        name: "AuthLayout"
        templateUrl: "auth-layout.html"
      )
      .state( "app", 
        abstract: true
        controller: "AppCtrl as app"
      )

    #
    # Routes
    $urlRouterProvider
      .when("","/users")
      .when("/", "/users")
      .otherwise("/404")

    #
    # Delay digest cycle when multiple async calls made to improve performance
    $httpProvider.useApplyAsync(true)

    #
    # Disable debug mode on "bighornimaging.com" domains for better performance
    if RegExp("telepjs.com", "i").test(window.location.host)
        $compileProvider.debugInfoEnabled(false)

  )
