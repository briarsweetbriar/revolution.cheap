Revolution.FormatMarkdownComponent = Em.Component.extend

  content: null

  formatedContent: (->
    Revolution.markdown.makeHtml(@get('content'))
  ).property('content')

  highlight: (->
    $('pre code').each (i, e) ->
      hljs.highlightBlock e
  ).on('didInsertElement')