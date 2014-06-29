Revolution.ProjectsShowEditRoute = Ember.Route.extend(
  Ember.SimpleAuth.AuthenticatedRouteMixin

  model: (params, queryParams, transition) ->
    @modelFor('projects.show')
  setupController: (controller, model) ->
    model.get('tags').then (tags) =>
      tagNames = tags.map (tag) -> tag.get('name')
      model.set('tagNames', tagNames)
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()

)