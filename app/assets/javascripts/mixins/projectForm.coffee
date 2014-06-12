Revolution.ProjectFormMixin = Ember.Mixin.create(

  users: null

  init: ->
    @store.find('user').then (users) =>
      @set('users', users)

  actions:
    addUser: ->
      projectRole = @store.createRecord('projectRole')
      @get('projectRoles').pushObject(projectRole)

    removeUser: (user) ->
      user.set "_destroy", true

)