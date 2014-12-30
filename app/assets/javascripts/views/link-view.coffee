Em.LinkView.reopen
	addDisqusTag: (->
	  commentCount = @get("commentCount")
	  if commentCount
	    href = @get("href")
	    disqusTag = "#disqus_thread"
	    @set "href", href + disqusTag
	).on("willInsertElement")