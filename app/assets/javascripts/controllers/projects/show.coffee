Revolution.ProjectsShowController = Ember.ObjectController.extend(

  currentUserHasRole: (->
    @get('session.currentUser').then (currentUser) =>
      @get('projectRoles').then (projectRoles) ->
        for role in projectRoles.content
          return true if role.get('user') == currentUser
        return false
  ).property('session.currentUser')
)