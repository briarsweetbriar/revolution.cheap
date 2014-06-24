Revolution.PostsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "post"
)