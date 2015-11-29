"use strict"

angular

  .module( "app.components" )

  .directive( "toggleSelected", ->
    scope:
      model: "=toggleSelected"
    link: (scope, element, attrs) ->
      element.addClass("toggle-selected")
      element.on("click", (event) ->
        if ! (/BUTTON|INPUT|A/).test(event.target.nodeName)
          scope.$apply( ->
            scope.model.$$selected = ! scope.model.$$selected
          )
      )

  )
