Revolution.TaggableControllerMixin = Ember.Mixin.create(

  init: ->
    @activeTagsChanged()
    @._super()

  hasActiveTag: true

  activeTagsChanged: (->
    activeTags = @get('parentController.activeTags')
    return @set('hasActiveTag', true) if activeTags.length == 0
    @get('tags').then (tags) =>
      for tag in tags.content
        return @set('hasActiveTag', true) if activeTags.contains tag
      @set('hasActiveTag', false)
  ).observes('parentController.activeTags.@each')
)