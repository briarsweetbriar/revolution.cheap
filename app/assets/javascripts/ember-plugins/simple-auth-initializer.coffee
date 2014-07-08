Ember.Application.initializer
  name: "authentication"
  initialize: (container, application) ->
    Ember.SimpleAuth.Session.reopen
      currentUser: (->
        userId = @get('user_id')
        if !Ember.isEmpty(userId)
          container.lookup('store:main').find('user', userId)
      ).property('user_id')

      userId: (->
        @get('user_id') || null
      ).property('user_id')

    Ember.SimpleAuth.setup container, application,
      authorizerFactory: "ember-simple-auth-authorizer:devise"
      routeAfterAuthentication: 'posts'
      routeAfterInvalidation: 'posts'

    container.injection("component", 'session', 'ember-simple-auth-session:main')