Revolution.TagItemComponent = Em.Component.extend

  tagName: 'li'
  classNames: ['tag-list__item']
  classNameBindings: ['active']
  targetController: null
  tag: null

  active: (->
    activeTags = @get('targetController.activeTags')
    tag = @get('tag')
    if activeTags.contains(tag)
      return true
    else
      return false
  ).property('targetController.activeTags.@each')

  click: ->
    activeTags = @get('targetController.activeTags')
    tag = @get('tag')
    if activeTags.contains(tag)
      activeTags.removeObject(tag)
    else
      activeTags.pushObject(tag)