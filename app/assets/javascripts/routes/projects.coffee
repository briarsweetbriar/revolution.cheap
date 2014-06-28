Revolution.ProjectsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "project"
  setupController: (controller, model) ->
    controller.set('model', model)
    @store.findAll("tag").then (tags) =>
      filteredTags = tags.filter (tag) ->
        tag.get('projectsCount') > 0
      controller.set('tags', filteredTags )
)