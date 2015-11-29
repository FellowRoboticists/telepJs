"use strict"

angular

  .module('app.directives')

  .directive("quarterPicker", ->
    restrict: 'E'
    replace: true
    scope:
      quarter: '='
    controller: "QuarterPickerCtrl"
    controllerAs: "picker"
    bindToController: true
    templateUrl: "quarter-picker.html"
  )

  .controller( "QuarterPickerCtrl", (_, QUARTERS, QUARTER_TPL)->

    vm = @

    _.isPlainObject(vm.quarter) || vm.quarter = angular.copy(QUARTER_TPL)

    vm.QUARTERS = QUARTERS

    vm.toggle = (quarter) ->
      vm.quarter[quarter] = !vm.quarter[quarter]

  )

#   .service( "QuarterPicker", (QUARTER_TPL) ->
#     class Quarter
#       constructor: (@quarter=QUARTER_TPL) ->
#       toggle: (qtrQtr) ->
#         @quarter[quarter] = !@quarter[quarter]
#   )

  .constant( "QUARTERS", [
    {"key":"ne","label":"NE"},
    {"key":"nw","label":"NW"},
    {"key":"sw","label":"SW"},
    {"key":"se","label":"SE"}
  ])

  .constant( "QUARTER_TPL",
    ne:false
    nw:false
    sw:false
    se:false
  )