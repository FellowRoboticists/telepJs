"use strict"

angular

  .module( "app.filters" )

  .filter( "naturalListFilter", ->
    (listArr) ->
      return listArr unless angular.isArray(listArr)
      for item, i in listArr
        if i is 0
          list = item
        else if 0 < i <= listArr.length-2
          list += ", #{item}"
        else
          list += " and #{item}"
      return list
  )