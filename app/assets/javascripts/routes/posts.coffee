Revolution.PostsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "post"
  setupController: (controller, model) ->
    tags = @store.findAll "tag"
    controller.set('tags', tags)
    controller.set('model', model)
)