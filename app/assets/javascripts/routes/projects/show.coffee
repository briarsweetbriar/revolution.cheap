Revolution.ProjectsShowRoute = Ember.Route.extend(
  serialize: (model, params) ->
    project_id: model.get("slug")
)