Revolution.MembersShowPostsRoute = Ember.Route.extend(
  model: ->
    @store.findAll("post").then (posts) =>
      filteredPosts = posts.filter (post) =>
        post.get('user').then (user) =>
          user.get('id') != @modelFor('members.show').id
      filteredPosts.sortBy('createdAt').reverse()
  setupController: (controller, model) ->
    controller.set('model', model)
    @store.findAll("tag").then (tags) =>
      filteredTags = tags.filter (tag) ->
        tag.get('postsCount') > 0
      filteredTags = filteredTags.sortBy('postsCount').reverse()
      controller.set('tags', filteredTags )
)