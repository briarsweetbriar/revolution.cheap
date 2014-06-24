Revolution.PostsShowEditRoute = Ember.Route.extend(
  Ember.SimpleAuth.AuthenticatedRouteMixin

  model: (params, queryParams, transition) ->
    @modelFor('posts.show')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()

)