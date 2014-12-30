Revolution.PostsView = Em.View.extend(
  Revolution.ToTopMixin
  Revolution.InfiniteScrollViewMixin
  Revolution.DisqusCommentCount

  didInsertElement: ->
    @setupInfiniteScrollListener()

  willDestroyElement: ->
    @teardownInfiniteScrollListener()
)