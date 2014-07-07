Template.navbar.currentUserId = ->
  Meteor.userId()


Router.map ->
  @route "home", {
    path: "/"
  }

  @route "friends", {
    path: "/friends"
    controller: "FriendsController"
  }

  @route "friends_recipes", {
    path: "/friends_recipes"
    controller: "FriendsRecipesController"
  }

  @route "recipes", {
    path: "/recipes",
    controller: "RecipesController"
  }


Router.configure {
  layoutTemplate: "layout"
}