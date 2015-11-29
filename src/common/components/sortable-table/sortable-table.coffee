"use strict"

angular

  .module("app.components")

  .directive("sortableTable", ->
    restrict: "A"
    controller: "SortableTableCtrl"
    scope:
      collection: "="
    link: (scope, elem, attrs, table) ->
      elem.addClass("sortable-table")
      return
  )

  .controller( "SortableTableCtrl", ($scope) ->
    @collection = $scope.collection
    @sort = (sort) ->
      $scope.collection.sortBy( sort )
    return
  )

  .directive("sortColumn", ->
    restrict: "A"
    require: "^sortableTable"
    transclude: true
    templateUrl: "sort-column.html"
    scope:
      sortBy: "=sortColumn"
    link: (scope, elem, attrs, table) ->
      elem.addClass("sort-column-header")
      scope.collection = table.collection
      elem.bind("click", (e) ->
        scope.$apply( ->
          table.sort(scope.sortBy)
        )
      )
      return
  )
