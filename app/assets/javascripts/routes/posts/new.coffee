Revolution.PostsNewRoute = Ember.Route.extend(
  Ember.SimpleAuth.AuthenticatedRouteMixin

  model: ->
    @store.createRecord('post')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.model').rollback()

)