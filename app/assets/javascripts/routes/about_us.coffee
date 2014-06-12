Revolution.AboutUsRoute = Ember.Route.extend(
  model: ->
    @store.findAll "user"
)