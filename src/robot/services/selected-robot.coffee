"use strict"

angular

  .module( "app.robot" )

  .factory( "selectedRobot", ( locker, SessionFactory, NotificationsFactory, Collection, _ ) ->

    vm = @

    #
    # Init cached robot
    vm.init = (user) ->
      angular.extend( vm, locker.get("current-robot-#{user.id}", null) )

    vm.init(SessionFactory)

    #
    # Set current robot
    vm.set = (robot) ->
      locker.put( "current-robot-#{SessionFactory.user.id}", angular.extend(vm, robot) )

    #
    # Clear current robot
    vm.clear = ->
      locker.forget("current-robot-#{SessionFactory.user.id}")
      vm.id = vm.name = null

    #
    # Schema
    vm.toJSON = ->
      "id": @id
      "name": @name

    return vm
  )

