Revolution.MembersShowRoute = Ember.Route.extend(
  serialize: (model, params) ->
    user_id: model.get("slug")
)