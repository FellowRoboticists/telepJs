"use strict"

angular

  .module( "app.components" )

  .directive( "tableBar", ->
    restrict: "E"
    replace: true
    transclude: true
    templateUrl: "table-bar.html"
  )