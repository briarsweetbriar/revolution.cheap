module 'Routing specs'

test "root route", ->
  routesTo('/', 'home')

test "login route", ->
  routesTo('/login', 'login')

test "projects route", ->
  routesTo('/projects', 'projects.index')

test "new project route", ->
  routesTo('/projects/new', 'projects.new')

test "project route", ->
  routesTo('/projects/project_1', 'projects.show.index')

test "edit project route", ->
  login()
  andThen ->
    routesTo('/projects/project_1/edit', 'projects.show.edit')

test "about_us route", ->
  routesTo('/about_us', 'about_us')

test "member route", ->
  routesTo('/members/user_1', 'members.show.index')

test "edit member route", ->
  login()
  andThen ->
    routesTo('/members/user_1/edit', 'members.show.edit')