Revolution.MembersShowController = Ember.ObjectController.extend(

  currentUserIsMember: false

  userIsMember: (->
    userId = @get('session.userId')
    if `this.get('id') == userId`
      @set("currentUserIsMember", true)
    else
      @set("currentUserIsMember", false)
  ).observes('session.userId', 'id')
)