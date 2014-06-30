Revolution.MembersShowPostsView = Em.View.extend(
  Revolution.ToTopMixin
  Revolution.InfiniteScrollViewMixin

  didInsertElement: ->
    @setupInfiniteScrollListener()

  willDestroyElement: ->
    @teardownInfiniteScrollListener()
)