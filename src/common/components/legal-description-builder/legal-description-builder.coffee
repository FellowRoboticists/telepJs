"use strict"

angular

  .module('app.directives')

  .directive("legalDescriptionBuilder", ->
    restrict: "E"
    replace: true
    scope:
      document: "="
    controller: "LegalDescriptionBuilderCtrl"
    controllerAs: "builder"
    bindToController: true
    templateUrl: "legal-description-builder.html"
  )

  .controller( "LegalDescriptionBuilderCtrl", ($q, _, LEGAL_DESCRIPTION_TPL)->

    vm = @

    _.isPlainObject(vm.description) || angular.copy(LEGAL_DESCRIPTION_TPL, vm.description)

    vm.edit = (description) ->
      hashKey = description.$$hashKey
      vm.description = angular.copy(description)
      vm.description.$$hashKey = hashKey

    vm.add = (description) ->
      builder = @
      $q( (resolve, reject) ->
        builder.document.legalDescriptions.unshift( angular.copy(description) )
        resolve(description)
      )

    vm.update = (description) ->
      builder = @
      hashKey = description.$$hashKey
      descriptions = builder.document.legalDescriptions
      $q( (resolve, reject) ->
        index = descriptions.indexOf( _.find(descriptions, {"$$hashKey":hashKey}) )
        descriptions[index] = angular.copy(description)
        resolve(description)
      )

    vm.save = (description) ->
      if description.$$hashKey
        @update(description).then( (reponse) ->
          vm.reset()
        )
      else
        @add(description).then( (response) ->
          vm.reset()
        )

    vm.delete = (description) ->
      builder = @
      descriptions = builder.document.legalDescriptions
      $q( (resolve, reject) ->
        index = descriptions.indexOf( description )
        descriptions.splice(index,1)
        resolve(description)
      )

    vm.reset = ->
      vm.description = angular.copy(LEGAL_DESCRIPTION_TPL)

    return
  )

  .constant("LEGAL_DESCRIPTION_TPL",
    township: null
    range: null
    section: null
    quarters:
      ne:
        ne:false
        nw:false
        sw:false
        se:false
      nw:
        ne:false
        nw:false
        sw:false
        se:false
      sw:
        ne:false
        nw:false
        sw:false
        se:false
      se:
        ne:false
        nw:false
        sw:false
        se:false
  )