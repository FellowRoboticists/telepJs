"use strict"

angular

  .module( "app.components" )

  .directive( "basicSearch", ->
    restrict: "E"
    replace: true
    templateUrl: "basic-search.html"
    scope:
      model: "="
      placeholder: "@"
    controller: "BasicSearchCtrl"
    controllerAs: "search"
    bindToController: true
  )

  .controller( "BasicSearchCtrl", ->

    vm = @

    vm.clear = ->
      vm.model = ""

    return
  )
