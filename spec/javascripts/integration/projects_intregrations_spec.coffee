module "projects integration"

test "projects index page", ->
  visit "/projects"
  andThen ->
    projects_length = find(".image-list li").length
    equal projects_length, 2, "Expected projects to contain 2 items, got: #{ projects_length }"

test "Visiting a project via the index screen", ->
  visit("/projects").click "ul li:last a"
  andThen ->
    project = find("h1").text()
    expected_result = "Project 2"
    equal project, expected_result, "Expected: #{ expected_result }, got: #{ project }"

test "renders project", ->
  visit "/projects/project_1"
  andThen ->
    project = find("h1").text()
    expected_result = "Project 1"
    equal project, expected_result, "Expected: #{ expected_result }, got: #{ project }"

test "renders edit button if currentUser has a projectRole", ->
  login()
  andThen ->
    visit "/projects/project_1"
    andThen ->
      edit_length = find(".edit-button").length
      ok edit_length >= 1, "Edit button not found"

test "does not render edit button if currentUser has no projectRole", ->
  login()
  andThen ->
    visit "/projects/project_2"
    andThen ->
      edit_length = find(".edit-button").length
      ok edit_length is 0, "Edit button present"

test "redirects if user does not have edit privileges", ->
  visit "/projects/project_2/edit"
  andThen ->
    header_text = find("h1").text()
    expected_result = "Login"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "click edit button to go to project edit page", ->
  login()
  andThen ->
    visit "/projects/project_1"
    andThen ->
      click ".edit-button"
      andThen ->
        input_fields = find(".form-fields li").length
        ok input_fields >= 1, "Input field not found"

test "saving edits persists the changes to the project then redirects to project page", ->
  login()
  andThen ->
    visit "/projects/project_1/edit"
    andThen ->
      fillIn "input[name='title']", "Valid Project"
      click "#submit_button"
      andThen ->
        header_text = find("h1").text()
        expected_result = "Valid Project"
        equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "Show input for new project", ->
  login()
  andThen ->
    visit("/projects/new")
    andThen ->
      input_fields = find(".form-fields li").length
      ok input_fields >= 1, "Input field not found"

test "Adding a new project", ->
  login()
  andThen ->
    visit("/projects/new")
    fillIn "input[name='title']", "Valid Project"
    click "#submit_button"
    andThen ->
      header_text = find("h1").text()
      expected_result = "Valid Project"
      equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "Adding a new project with invalid attributes", ->
  login()
  andThen ->
    visit("/projects/new")
    fillIn "input[name='title']", "Invalid Project"
    click "#submit_button"
    andThen ->
      error_text = find(".error-block p").text()
      expected_result = "is invalid"
      equal error_text, expected_result, "Expected: #{ expected_result }, got: #{ error_text }"