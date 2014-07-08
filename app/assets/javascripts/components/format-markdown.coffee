Revolution.FormatMarkdownComponent = Em.Component.extend

  content: null

  formatedContent: (->
    Revolution.markdown.makeHtml(@get('content')) if @get('content')
  ).property('content')

  highlight: (->
    $('pre code').each (i, e) ->
      hljs.highlightBlock e
  ).on('didInsertElement')

  linksOpenNewTab: (->
    $(document.links).filter( ->
      @hostname != window.location.hostname
    ).attr('target', '_blank')
  ).on('didInsertElement')

