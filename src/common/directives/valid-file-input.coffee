"use strict"

angular

  .module( "app.directives" )

  .directive("validFileInput", ->
    require:"ngModel"
    link: (scope, el, attrs, ngModel) ->

      ngModel.$render = ->
        ngModel.$setViewValue(el.val())

      el.bind("change", ->
        scope.$apply( ->
          ngModel.$render()
        )
      )

#       scope.$watch( ->
#         ngModel.$modelValue
#       , (newVal, oldVal) ->
#         console.log(newVal, oldVal)
#       )
  )