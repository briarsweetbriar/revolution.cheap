Revolution.PostListItemComponent = Em.Component.extend(
  classNames: "post-list__item"
  tagName: "li"

  item: null
  targetController: null

  expanded: false

  autoExpand: (->
    if @get('item.body')? && @get('item.body').length < 500
      @set('expanded', true)
  ).on('didInsertElement')

  actions:
    expand: ->
      @set("expanded", true)
)