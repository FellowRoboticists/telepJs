"use strict"

angular

  .module( "app.robot" )

  .factory( "robotPicker", ( locker, Collection, selectedRobot, NotificationsFactory, User, $interpolate, _, ROBOT ) ->

    vm = @

    #
    # Account robots cache
    vm.robots = []

    #
    # Cache robot list
    vm.getRobots = (user) ->
      new User(user).robots().then( (robots) ->
        vm.robots = new Collection.fromArray(robots).sortBy("name")
        selectedRobot.init(user)
        if ! vm.hasRobot(selectedRobot) and selectedRobot.id?
          NotificationsFactory.warning $interpolate(ROBOT.MESSAGES.REMOVED_SELECTED)(selectedRobot)
          selectedRobot.clear()
      )

    #
    # Has access to selected robot?
    vm.hasRobot = (Robot) ->
      vm.id in _.pluck(vm.robots, "id")

    #
    # Select robot
    vm.select = (robot) ->
      selectedRobot.set(robot)
      NotificationsFactory.success $interpolate(ROBOT.MESSAGES.SELECTED)(selectedRobot)

    #
    # Clear robot
    vm.clear = ->
      NotificationsFactory.success $interpolate(ROBOT.MESSAGES.DESELECTED)(selectedRobot)
      selectedRobot.clear()

    return vm
  )

