Revolution.DisqusCommentCount = Em.Mixin.create(
  setupCommentCount: (->
    disqusShortname = Revolution.DisqusOptions.get("shortname")
    window.disqus_shortname = disqusShortname
    Em.run.later this, (->
      s = document.createElement("script")
      s.async = true
      s.type = "text/javascript"
      s.src = "//" + disqusShortname + ".disqus.com/count.js"
      (document.getElementsByTagName("HEAD")[0] or document.getElementsByTagName("BODY")[0]).appendChild s
    ), 1000
  ).on("didInsertElement")
)