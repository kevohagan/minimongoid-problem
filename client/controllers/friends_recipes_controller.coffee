class @FriendsRecipesController extends RouteController

  waitOn: ->
    @subscribe('recipes')
    @subscribe('userData')

  data: ->
    recipes: ->
      recipes = _.reduceRight(User.current().friends(), (a, b) ->
        a.concat b.recipes()
      , [])
      recipes