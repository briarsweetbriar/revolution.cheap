Revolution.ProjectController = Ember.ObjectController.extend(
  Revolution.TaggableControllerMixin
  Revolution.MemberFilterableControllerMixin

  memberChanged: (->
    @get('projectRoles').then (projectRoles) =>
      for projectRole in projectRoles.content
        if `projectRole.get('user.id') == _this.id`
          return @set('isByMember', true)
        else
          @set('isByMember', false)
  ).observes('member')
)