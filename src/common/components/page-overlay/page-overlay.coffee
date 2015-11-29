"use strict"

angular

  .module( "app.components" )

  .directive( "pageOverlay", ->
    restrict: "E"
    replace: true
    templateUrl: "page-overlay.html"
  )
