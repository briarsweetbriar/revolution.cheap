Revolution.ProjectsNewRoute = Ember.Route.extend(
  Ember.SimpleAuth.AuthenticatedRouteMixin

  model: ->
    @store.createRecord('project')
  setupController: (controller, model) ->
    controller.set('controllers.projects.cinched', true)
    controller.set('content', model)
  deactivate: ->
    @set('controller.controllers.projects.cinched', false)
    @get('controller.model').rollback()

)