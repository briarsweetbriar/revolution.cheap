Revolution.LoginController = Ember.Controller.extend(
  Ember.SimpleAuth.LoginControllerMixin,
    authenticatorFactory: 'ember-simple-auth-authenticator:devise'
)