Revolution.PostsShowController = Ember.ObjectController.extend(
  needs: ['posts']

  currentUserIsOwner: false

  userIsOwner: (->
    userId = @get('session.userId')
    @get('user').then (user) =>
      if `user.get('id') == userId`
        @set("currentUserIsOwner", true)
      else
        @set("currentUserIsOwner", false)
  ).observes('session.userId', 'user')
)