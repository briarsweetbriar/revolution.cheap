Revolution.PostsShowRoute = Ember.Route.extend(
  serialize: (model, params) ->
    post_id: model.get("slug")
  setupController: (controller, model) ->
    controller.set('controllers.posts.cinched', true)
    controller.set('model', model)
  deactivate: ->
    @set('controller.controllers.posts.cinched', false)
)