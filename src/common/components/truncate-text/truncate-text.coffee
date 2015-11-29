"use strict"

angular

  .module("app.components")

  .directive("truncateText", ->

    restrict: "A"
    transclude: true
    template:'''
      <div class="truncate-text-container">
        <div class="truncate-text-content" ng-transclude></div>
        <div class="truncate-text-spacer" ng-transclude></div>
        <span>&nbsp;</span>
      </div>
    '''

  )