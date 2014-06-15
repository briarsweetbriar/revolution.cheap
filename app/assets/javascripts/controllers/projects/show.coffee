Revolution.ProjectsShowController = Ember.ObjectController.extend(

  currentUserHasRole: false

  userRoleObserver: (->
    userId = @get('session.userId')
    @get('projectRoles').then (projectRoles) =>
      for role in projectRoles.content
        if `role.get('user.id') == userId`
          return @set("currentUserHasRole", true)
      @set("currentUserHasRole", false)
  ).observes('session.userId', 'projectRoles.@each.user')
)