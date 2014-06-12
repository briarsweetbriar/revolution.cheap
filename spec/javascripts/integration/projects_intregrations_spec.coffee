module "projects integration"

test "projects index page", ->
  visit "/projects"
  andThen ->
    header_text = find("h1").text()
    expected_result = "Projects"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "renders projects", ->
  visit "/projects"
  andThen ->
    projects_length = find(".images-list li").length
    equal projects_length, 2, "Expected projects to contain 2 items, got: #{ projects_length }"

test "Visiting a project via the index screen", ->
  visit("/projects").click "ul li:last a"
  andThen ->
    contact = find("h2").text()
    expected_result = "Project 2"
    equal contact, expected_result, "Expected: #{ expected_result }, got: #{ contact }"

test "renders project", ->
  visit "/projects/project_1"
  andThen ->
    header_text = find("h2").text()
    expected_result = "Project 1"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "renders edit button if currentUser has a projectRole", ->
  login
  andThen ->
    visit "/projects/project_1"
    andThen ->
      edit_length = find(".edit-button").length
      ok edit_length >= 1, "Edit button not found"

test "does not render edit button if currentUser has no projectRole", ->
  login
  andThen ->
    visit "/projects/project_2"
    andThen ->
      edit_length = find(".edit-button").length
      ok edit_length is 0, "Edit button not found"

test "Show input for new project", ->
  visit("/projects/new")
  andThen ->
    input_fields = find(".form-fields li").length
    ok input_fields >= 1, "Input field not found"

test "Adding a new project", ->
  visit("/projects/new")
  fillIn "input[name='title']", "Valid Project"
  click ".form-fields__button input"
  andThen ->
    header_text = find("h2").text()
    expected_result = "Valid Project"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "Adding a new project with invalid attributes", ->
  visit("/projects/new")
  fillIn "input[name='title']", "Invalid Project"
  click ".form-fields__button input"
  andThen ->
    error_text = find(".error-block p").text()
    expected_result = "is invalid"
    equal error_text, expected_result, "Expected: #{ expected_result }, got: #{ error_text }"