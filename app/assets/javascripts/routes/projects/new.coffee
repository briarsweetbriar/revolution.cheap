Revolution.ProjectsNewRoute = Ember.Route.extend(

  model: ->
    @store.createRecord('project')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.model').rollback()

)