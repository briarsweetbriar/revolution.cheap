Revolution.TaggableMixin = Ember.Mixin.create(
  tags: DS.hasMany 'tag',
    async: true

  tagNames: DS.attr('string')

  setTagNames: (->
    @get('tags').then (tags) =>
      tagNames = tags.map (tag) -> tag.get('name')
      @set('tagNames', tagNames)
  ).observes('tags.@each.name')

)