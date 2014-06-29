Revolution.ContactRoute = Ember.Route.extend(

  model: ->
    @store.createRecord('message')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.model').rollback()
)