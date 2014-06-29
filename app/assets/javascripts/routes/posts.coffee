Revolution.PostsRoute = Ember.Route.extend(
  Revolution.InfiniteScrollRouteMixin
  fetchPage: (page) ->
      @store.find 'post',
        order: "created_at desc"
        page: page
        per_page: 5
  setupController: (controller, model) ->
    @store.findAll("tag").then (tags) =>
      filteredTags = tags.filter (tag) ->
        tag.get('postsCount') > 0
      filteredTags = filteredTags.sortBy('postsCount').reverse()
      controller.set('tags', filteredTags )
    @._super(controller, model)

)