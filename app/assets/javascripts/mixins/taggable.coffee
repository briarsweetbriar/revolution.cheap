Revolution.TaggableMixin = Ember.Mixin.create(
  tags: DS.hasMany 'tag',
    async: true

  tagNames: DS.attr('string')

)