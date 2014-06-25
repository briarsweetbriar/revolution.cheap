# Teaspoon includes some support files, but you can use anything from your own support path too.
# require support/jasmine-jquery-1.7.0
# require support/jasmine-jquery-2.0.0
# require support/sinon
#= require support/route_recognizer
#= require support/fake_xml
#= require support/pretender
#= require support/authentication_helpers
#= require support/testing_helpers
#
# PhantomJS (Teaspoons default driver) doesn't have support for Function.prototype.bind, which has caused confusion.
# Use this polyfill to avoid the confusion.
#= require support/bind-poly
#
# Deferring execution
# If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call
# Teaspoon.execute() after everything has been loaded. Simple example of a timeout:
#
# Teaspoon.defer = true
# setTimeout(Teaspoon.execute, 1000)
#
# Matching files
# By default Teaspoon will look for files that match _spec.{js,js.coffee,.coffee}. Add a filename_spec.js file in your
# spec path and it'll be included in the default suite automatically. If you want to customize suites, check out the
# configuration in teaspoon_env.rb
#
# Manifest
# If you'd rather require your spec files manually (to control order for instance) you can disable the suite matcher in
# the configuration and use this file as a manifest.
#
# For more information: http://github.com/modeset/teaspoon
#
# You can require your own javascript files here. By default this will include everything in application, however you
# may get better load performance if you require the specific files that are being used in the spec that tests them.
#= require application

d = document
d.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')

Revolution.rootElement = "#ember-testing"
Revolution.setupForTesting()
Revolution.injectTestHelpers()

Ember.SimpleAuth.ApplicationRouteMixin.reopen
  actions:
    sessionInvalidationSucceeded: ->

QUnit.testStart = ->
  logout()
  posts = [
    id: 1
    title: "Post 1"
    slug: "post_1"
    user_id: 1
  ,
    id: 2
    title: "Post 2"
    slug: "post_2"
    user_id: 2
  ]
  projects = [
    id: 1
    title: "Project 1"
    slug: "project_1"
    project_role_ids: [ 1 ]
  ,
    id: 2
    title: "Project 2"
    slug: "project_2"
    project_role_ids: [ 2 ]
  ]
  projectRoles = [
    id: 1
    project_id: 1
    user_id: 1
  ,
    id: 2
    project_id: 2
    user_id: 2
  ]
  users = [
    id: 1
    username: "User 1"
    slug: "user_1"
    project_role_ids: [ 1 ]
    post_ids: [ 1 ]
  ,
    id: 2
    username: "User 2"
    slug: "user_2"
    project_role_ids: [ 2 ]
    post_ids: [ 2 ]
  ]
  server = new Pretender(->
    @get "/posts", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(posts: posts) ]

    @get "posts/:post_id", (request) ->
      post = posts.find((post) ->
        post  if post.slug is request.params.post_id
      )
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(post: post) ]

    @post "/posts", (request) ->
      if $.parseJSON(request.requestBody).post.title == "Valid Post"
        [ 200,
          "Content-Type": "application/json"
        , JSON.stringify(post: { "id": 3, "title": "Valid Post", "slug": "valid_post", "user_id": 1 } ) ]
      else
        [ 422,
          "Content-Type": "application/json"
        , JSON.stringify({ "errors": { "title": "is invalid" } }) ]

    @put "/posts", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(post: { "id": 1, "title": "Valid Post", "slug": "valid_post", "user_id": 1 } ) ]

    @get "/projects", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(projects: projects) ]

    @get "projects/:project_id", (request) ->
      project = projects.find((project) ->
        project  if project.slug is request.params.project_id
      )
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(project: project) ]

    @post "/projects", (request) ->
      if $.parseJSON(request.requestBody).project.title == "Valid Project"
        [ 200,
          "Content-Type": "application/json"
        , JSON.stringify(project: { "id": 3, "title": "Valid Project", "slug": "valid_project" } ) ]
      else
        [ 422,
          "Content-Type": "application/json"
        , JSON.stringify({ "errors": { "title": "is invalid" } }) ]

    @put "/projects", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(project: { "id": 1, "title": "Valid Project", "slug": "valid_project" } ) ]

    @get "/projects", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(projects: projects) ]

    @get "projects/:project_id", (request) ->
      project = projects.find((project) ->
        project  if project.slug is request.params.project_id
      )
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(project: project) ]

    @post "/projects", (request) ->
      if $.parseJSON(request.requestBody).project.title == "Valid Project"
        [ 200,
          "Content-Type": "application/json"
        , JSON.stringify(project: { "id": 3, "title": "Valid Project", "slug": "valid_project" } ) ]
      else
        [ 422,
          "Content-Type": "application/json"
        , JSON.stringify({ "errors": { "title": "is invalid" } }) ]

    @put "/projects", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(project: { "id": 1, "title": "Valid Project", "slug": "valid_project" } ) ]

    @get "project_roles/:id", (request) ->
      project_role = projectRoles.find((project_role) ->
        project_role  if project_role.id is request.params.id
      )
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(project_role: project_role) ]

    @get "/project_roles", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(project_roles: projectRoles) ]

    @post "/users/sign_in", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify({ "user_token": "auth-token", "user_email": "user@email.com", "user_id": 1 }) ]

    @get "users/:user_id", (request) ->
      user = users.find((user) ->
        user  if user.slug is request.params.user_id or user.id.toString() is request.params.user_id
      )
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(user: user) ]

    @get "/users", (request) ->
      [ 200,
        "Content-Type": "application/json"
      , JSON.stringify(users: users) ]
  )