"use strict"

angular

  .module( "app.components" )

  .directive("checkmark", ->
    restrict: 'E'
    replace: true
    scope:
      checked: '='
    templateUrl: "checkmark.html"
  )
