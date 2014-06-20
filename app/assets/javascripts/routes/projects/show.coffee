Revolution.ProjectsShowRoute = Ember.Route.extend(
  serialize: (model, params) ->
    project_id: model.get("slug")
  setupController: (controller, model) ->
    controller.set('controllers.projects.cinched', true)
    controller.set('model', model)
  deactivate: ->
    @set('controller.controllers.projects.cinched', false)
)