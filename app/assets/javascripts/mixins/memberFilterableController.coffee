Revolution.MemberFilterableControllerMixin = Ember.Mixin.create(

  init: ->
    @memberChanged()
    @._super()

  isByMember: false

  memberChanged: (->
    if `this.get('member.id') == this.id`
      @set('isByMember', true)
    else
      @set('isByMember', false)
  ).observes('member')
)