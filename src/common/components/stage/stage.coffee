"use strict"

angular

  .module( "app.components" )

  .directive( "stage", ->
    restrict: "E"
    replace: true
    transclude: true
    templateUrl: "stage.html"
  )
