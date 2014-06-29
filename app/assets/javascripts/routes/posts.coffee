Revolution.PostsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "post"
  setupController: (controller, model) ->
    controller.set('model', model)
    @store.findAll("tag").then (tags) =>
      filteredTags = tags.filter (tag) ->
        tag.get('postsCount') > 0
      filteredTags = filteredTags.sortBy('postsCount').reverse()
      controller.set('tags', filteredTags )
)