Revolution.DisqusCommentsComponent = Em.Component.extend(

  elementId: "disqus_thread"
  classNames: [ "comments" ]
  timer: null

  setupDisqus: (->
    controller = @get("item")
    title = controller.get("title")
    window.disqus_title = title
    unless window.DISQUS
      disqusShortname = Revolution.DisqusOptions.get("shortname")
      window.disqus_shortname = disqusShortname
      dsq = document.createElement("script")
      dsq.type = "text/javascript"
      dsq.async = true
      dsq.src = "//" + disqusShortname + ".disqus.com/embed.js"
      (document.getElementsByTagName("head")[0] or document.getElementsByTagName("body")[0]).appendChild dsq
  ).on("didInsertElement")

  loadNewPostComments: (->
    if window.DISQUS
      @reset()
    else
      @set "timer", Em.run.debounce(this, @loadNewPostComments, 100)
  ).on("willInsertElement")

  reset: ->
    controller = @get("item")
    postIdentifier = controller.get("urlString")
    postUrl = window.location.href
    Em.run.scheduleOnce "afterRender", ->
      window.DISQUS.reset
        reload: true
        config: ->
          @page.identifier = postIdentifier
          @page.url = postUrl
)