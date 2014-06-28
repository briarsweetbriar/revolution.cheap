Revolution.PostsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "post"
  setupController: (controller, model) ->
    controller.set('model', model)
    @store.findAll("tag").then (tags) =>
      filteredTags = tags.filter (tag) ->
        tag.get('postsCount') > 0
      controller.set('tags', filteredTags )
)