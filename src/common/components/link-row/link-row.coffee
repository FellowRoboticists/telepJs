"use strict"

angular

  .module( "app.components" )

  .directive( "linkRow", ($location) ->
    scope:
      url: "@"
    link: (scope, element, attrs) ->
      element.addClass("link-row")
      element.on("click", (event) ->
        if ! (/BUTTON|INPUT|A/).test(event.target.nodeName)
          scope.$apply( ->
            $location.url(attrs.linkRow)
          )
      )

  )
