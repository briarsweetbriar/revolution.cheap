Revolution.PostsNewRoute = Ember.Route.extend(
  Ember.SimpleAuth.AuthenticatedRouteMixin

  model: ->
    @store.createRecord('post')
  setupController: (controller, model) ->
    controller.set('controllers.posts.cinched', true)
    controller.set('content', model)
  deactivate: ->
    @set('controller.controllers.posts.cinched', false)
    @get('controller.model').rollback()
)