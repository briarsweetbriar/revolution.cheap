Revolution.ProjectsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "project"
)