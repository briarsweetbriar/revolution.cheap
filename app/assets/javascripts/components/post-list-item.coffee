Revolution.PostListItemComponent = Em.Component.extend(
  classNames: "post-list__item"
  tagName: "li"

  item: null
  targetController: null

  currentUserIsOwner: false
  expanded: false

  autoExpand: (->
    if @get('item.body')? && @get('item.body').length < 500
      @set('expanded', true)
  ).on('didInsertElement')

  userIsOwner: (->
    userId = @get('session.userId')
    @get('item.user').then (user) =>
      if `user.get('id') == userId`
        @set("currentUserIsOwner", true)
      else
        @set("currentUserIsOwner", false)
  ).observes('session.userId', 'item.user')

  actions:
    expand: ->
      @set("expanded", true)
)