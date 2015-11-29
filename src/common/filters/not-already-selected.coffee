"use strict"

angular

  .module( "app.filters" )

  .filter( "notAlreadySelected", ->
    (items) ->

      return unless angular.isArray(items)

      filteredItems = []

      for item in items
        filteredItems.push(item) unless item.$$selected

      filteredItems
  )