Revolution.ContactController = Ember.ObjectController.extend(

  messaged: false

  actions:
    submit: (event, view) ->
      @get('model').save().then(((response) =>
        @transitionToRoute("contact.thanks")
      ),
      ((response) =>
        console.log(response.errors)
      ))
        
)