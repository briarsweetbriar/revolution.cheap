Revolution.InfiniteScrollViewMixin = Ember.Mixin.create(
  setupInfiniteScrollListener: ->
    $(window).on "scroll", $.proxy(@didScroll, this)
    @didScroll(true)

  teardownInfiniteScrollListener: ->
    $(window).off "scroll", $.proxy(@didScroll, this)

  didScroll: (freshLoad) ->
    @get("controller.target").send "loadNextPage"  if @isScrolledToBottom() || freshLoad == true

  isScrolledToBottom: ->
    distanceToViewportTop = ($(document).height() - $(window).height())
    viewPortTop = $(document).scrollTop()
    return false  if viewPortTop is 0
    distanceToViewportTop - viewPortTop <= 500
)