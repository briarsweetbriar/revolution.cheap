Revolution.PostController = Ember.ObjectController.extend(
  needs: ['posts']

  posts: null
  postsBinding: 'controllers.posts'

  hasActiveTag: true

  activeTagsChanged: (->
    activeTags = @get('posts.activeTags')
    return @set('hasActiveTag', true) if activeTags.length == 0
    @get('tags').then (tags) =>
      for tag in tags.content
        return @set('hasActiveTag', true) if activeTags.contains tag
      @set('hasActiveTag', false)
  ).observes('posts.activeTags.@each')
)