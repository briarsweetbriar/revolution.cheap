Revolution.MarkdownFormatComponent = Em.Component.extend(

  content: null

  formatedContent: (->
    new Handlebars.SafeString(Revolution.markdown.makeHtml(@get('content')))
  ).property('content')
)