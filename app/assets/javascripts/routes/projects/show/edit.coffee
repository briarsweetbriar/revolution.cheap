Revolution.ProjectsShowEditRoute = Ember.Route.extend(
  Ember.SimpleAuth.AuthenticatedRouteMixin

  model: (params, queryParams, transition) ->
    @modelFor('projects.show')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()

)