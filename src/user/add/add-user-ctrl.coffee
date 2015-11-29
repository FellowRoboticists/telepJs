"use strict"

angular

  .module( "app.user" )

  .controller( "AddUserCtrl", ($state, User, Account, NotificationsFactory, SessionFactory, Collection, $interpolate, REGEX, USER_TPL, MESSAGES ) ->

    vm = @

    vm.REGEX = REGEX
    vm.session = SessionFactory.toJSON()
    vm.user = new User(USER_TPL)

    #
    # Get accounts
    Account.query()
      .then( (accounts) ->
        vm.accounts = new Collection.fromArray(accounts).sortBy("name")
      ,(error) ->
        NotificationsFactory.error $interpolate(MESSAGES.CRUD.ERROR.RETRIEVE)({name:"Accounts"})
      )

    vm.save = (user) ->
      user.save()
        .then( (user) ->
          NotificationsFactory.successAfterTransition $interpolate(MESSAGES.CRUD.SUCCESS.CREATE)({name: user.name})
          $state.go("app.users.list")
        , (error) ->
          NotificationsFactory.error $interpolate(MESSAGES.CRUD.ERROR.CREATE)({name:"User"})
        )

    return

  )