Revolution.InfiniteScrollViewMixin = Ember.Mixin.create(
  setupInfiniteScrollListener: ->
    $(window).on "scroll", $.proxy(@didScroll, this)
    @loadNextPage()

  teardownInfiniteScrollListener: ->
    $(window).off "scroll", $.proxy(@didScroll, this)

  loadNextPage: ->
    @get("controller.target").send "loadNextPage"

  didScroll: ->
    @loadNextPage()  if @isScrolledToBottom()

  isScrolledToBottom: ->
    distanceToViewportTop = ($(document).height() - $(window).height())
    viewPortTop = $(document).scrollTop()
    return false  if viewPortTop is 0
    distanceToViewportTop - viewPortTop <= 500
)