module 'Routing specs'

test "root route", ->
  routesTo('/', 'posts.index')

test "new post route", ->
  routesToWithLogin('/posts/new', 'posts.new')

test "post route", ->
  routesTo('/posts/post_1', 'posts.show.index')

test "edit post route", ->
  routesToWithLogin('/posts/post_1/edit', 'posts.show.edit')

test "login route", ->
  routesTo('/login', 'login')

test "projects route", ->
  routesTo('/projects', 'projects.index')

test "new project route", ->
  routesToWithLogin('/projects/new', 'projects.new')

test "project route", ->
  routesTo('/projects/project_1', 'projects.show.index')

test "edit project route", ->
  routesToWithLogin('/projects/project_1/edit', 'projects.show.edit')

test "about_us route", ->
  routesTo('/about_us', 'about_us')

test "member route", ->
  routesTo('/members/user_1', 'members.show.index')

test "edit member route", ->
  routesToWithLogin('/members/user_1/edit', 'members.show.edit')