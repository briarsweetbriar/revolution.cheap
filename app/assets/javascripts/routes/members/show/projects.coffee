Revolution.MembersShowProjectsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "project"
  setupController: (controller, model) ->
    controller.set('model', model)
    @store.findAll("tag").then (tags) =>
      filteredTags = tags.filter (tag) ->
        tag.get('projectsCount') > 0
      filteredTags = filteredTags.sortBy('projectsCount').reverse()
      controller.set('tags', filteredTags )
)