"use strict"

angular

  .module( "app" )

  .controller("AppCtrl", ($rootScope, $http, $state, User, AuthService, SessionFactory, Collection, NotificationsFactory, $interpolate, selectedRobot, robotPicker, loader, MESSAGES)->

    vm = @

    vm.$state = $state
    vm.session = SessionFactory
    vm.selectedRobot = selectedRobot
    vm.robotPicker = robotPicker
    vm.loader = loader

    #
    # Load robots for dropdown
    if SessionFactory.user.id
      robotPicker.getRobots(SessionFactory.user)

    #
    # Select robot
    vm.select = (robot) ->
      robotPicker.select(robot)

    #
    # Clear selected robot
    vm.clear = ->
      robotPicker.clear()

    #
    # Let's blow this popcicle stand!
    vm.logout = ->
      AuthService.logout().then( (response) ->
        NotificationsFactory.successAfterTransition MESSAGES.LOGOUT_SUCCESS
        selectedRobot.clear()
        $state.go("app.login")
      , (error) ->
        NotificationsFactory.error MESSAGES.LOGOUT_ERROR
      )

    return
  )
