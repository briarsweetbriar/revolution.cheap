Ember.Handlebars.helper "format-markdown", (input) ->
  if input?
    new Ember.Handlebars.SafeString("<div class='markdown-content'>#{ new Handlebars.SafeString(Revolution.markdown.makeHtml(input)) }</div>")