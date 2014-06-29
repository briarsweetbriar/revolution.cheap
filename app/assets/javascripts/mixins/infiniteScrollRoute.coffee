Revolution.InfiniteScrollRouteMixin = Ember.Mixin.create(
  model: ->
    @set "page", 0
    []

  fetchPageProxy: (page) ->
    @set "currentlyFetchingPage", true
    @fetchPage(page).then (objects) =>
      @set "page", @get('page') + 1
      Ember.run.next =>
        @set "currentlyFetchingPage", false

      if objects.get("length") is 0
        @setCanLoadMore false
      else
        @setCanLoadMore true
      objects

  setupController: (controller, model) ->
    @setCanLoadMore true
    controller.set "canLoadMore", @get("canLoadMore")
    @._super(controller, model)

  setCanLoadMore: (canLoadMore) ->
    @set "canLoadMore", canLoadMore
    @controller.set "canLoadMore", canLoadMore  if @controller

  actions:
    loadNextPage: ->
      if @get("canLoadMore") and not @get("currentlyFetchingPage")
        @fetchPageProxy(@get("page")).then (objects) =>
          @controller.get("content").addObjects objects
)