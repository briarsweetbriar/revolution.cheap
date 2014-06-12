#= require ./store
#= require "ember-simple-auth"
#= require "ember-simple-auth-devise"
#= require_tree ./ember-plugins
#= require_tree ./mixins
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

Revolution.markdown = Markdown.getSanitizingConverter()