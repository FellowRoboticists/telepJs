"use strict"

angular

  .module( "app.directives" )

  .directive( "embedSrc", ($log) ->
    restrict: "A"
    link: (scope, element, attrs) ->
      current = element
      scope.$watch( ->
        attrs.embedSrc
      , (newVal, oldVal) ->
        clone = element.clone().attr("src", attrs.embedSrc)
        current.replaceWith(clone)
        current = clone
      )
  )