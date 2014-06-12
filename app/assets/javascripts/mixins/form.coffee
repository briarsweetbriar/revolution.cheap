Revolution.FormMixin = Ember.Mixin.create(

  actions:
    submit: (event, view) ->
      @get('model').save().then(((response) =>
        @transitionToRoute(@get("transitionTo"), @content)
      ),
      ((response) =>
        console.log(response.errors)
      ))


)