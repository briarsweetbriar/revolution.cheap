Revolution.ContactThanksRoute = Ember.Route.extend(
  setupController: (controller, model) ->
    controller.set('controllers.contact.messaged', true)
  deactivate: ->
    @set('controller.controllers.contact.messaged', false)
)