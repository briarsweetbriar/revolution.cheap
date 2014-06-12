Ember.Handlebars.helper "format-markdown", (input) ->
  if input?
    new Handlebars.SafeString(Revolution.markdown.makeHtml(input))