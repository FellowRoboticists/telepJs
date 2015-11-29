"use strict"

angular

  .module( "app.robot" )

  .constant( "ROBOT",

    #
    # Blank robot template
    "TEMPLATE":
      "id": null
      "account": null
      "name": null
      "number": null
      "status": 1
      "details": null
      "team": []

    #
    # Messaging
    "MESSAGES":

      "SELECTION_REMINDER":
        """
          To assign your search activity to a project, select the project from
          the menu at the top of the page.
        """

      "SELECTED":
        """
          &ldquo;<b>{{name}}</b>&rdquo; selected successfully. All of your document
          search activity will be attributed to &ldquo;<b>{{name}}</b>&rdquo; until
          to select another project from the dropdown menu.
        """

      "DESELECTED":
        """
          &ldquo;<b>{{name}}</b>&rdquo; has been deselected.<br><b>Note</b>: None
          of your document search activity will be attributed to a project until
          you select one from the dropdown menu.
        """

      "USER_ADDED":
        """
          You have been added, as a team member, to the &ldquo;<b>{{name}}</b>&rdquo;
          project! Contact <b>{{account.name}}</b> for more information.<br>
          <b>Note</b>: To assign your document searches to this project, select it
          in the dropdown menu above.
        """

      "USER_REMOVED":
        """
          You have been removed from the &ldquo;<b>{{name}}</b>&rdquo; project so
          you will no longer be able to assign search activity to it. Contact 
          <b>{{account.name}}</b> for more information.
        """

      "DELETED":
        """
          The &ldquo;<b>{{name}}</b>&rdquo; project has been deleted so you will
          no longer be able to assign search activity to it. Contact 
          <b>{{account.name}}</b> for more information.
        """

      "SUSPENDED":
        """
          The &ldquo;<b>{{name}}</b>&rdquo; project has been suspended so you will
          no longer be able to assign search activity to it. Contact 
          <b>{{account.name}}</b> for more information.
        """

      "REMOVED_SELECTED":
        """
          You may no longer assign search activity to &ldquo;<b>{{name}}</b>&rdquo;.
          The project may have been suspended or deleted by the account owner.
        """
  )

