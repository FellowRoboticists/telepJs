"use strict"

angular

  .module( "app.filters" )

  .filter( "truncate", ->
    (input, length) ->
      return input unless length
      return input unless input.length > length
      "#{input.substring(0,length)}..."
  )