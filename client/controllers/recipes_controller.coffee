class @RecipesController extends RouteController

  waitOn: ->
    Meteor.subscribe('recipes')
  data: ->
    my_recipes: User.current().recipes()



Template.recipes.events
  'click #recipe-save' : (e, t) ->
    e.preventDefault()
    recipe = Recipe.create {
      user_id: Meteor.userId()
      name:    $(t.find('#recipe-name')).val()
    }
    if recipe.errors
      $(t.find('#recipe-form')).addClass('error')
      $(t.find('#recipe-form .help-inline')).html(recipe.error_message())

Template.recipe.events
  'click .ingredient-save' : (e, t) ->
    e.preventDefault()
    ingredient = {name: $(t.find('.ingredient-name')).val()}
    quantity = $(t.find('.ingredient-quantity')).val()
    ingredient.quantity = parseInt(quantity) if (quantity)
    test = ingredient
    # this = this Recipe

    console.log @,test,quantity
    @push {
      ingredients: test
    }

  'click .del' : (e, t) ->
    e.preventDefault()
    recipe = this
    $(t.firstNode).fadeOut ->
      recipe.destroy()

Template.ingredient.events
  'click .del' : (e, t) ->
    e.preventDefault()
    @recipe.pull {
      ingredients: {name: @name}
    }


