module "login integration"

test "login page", ->
  visit "/login"
  andThen ->
    header_text = find("h1").text()
    expected_result = "Login"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "Visiting the login page from anywhere", ->
  visit("/projects").click "#login_link"
  andThen ->
    header_text = find("h1").text()
    expected_result = "Login"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "The login button is only visible when logged out", ->
  login()
  andThen ->
    visit("/projects")
    andThen ->
      login_length = find("#login_link").length
      expected_result = 0
      equal login_length, expected_result, "Expected: #{ expected_result }, got: #{ login_length }"
      logout_length = find("#logout_link").length
      ok logout_length >= 1, "Logout link not found"

test "The logout button is only visible when logged in", ->
  visit("/projects")
  andThen ->
    logout_length = find("#logout_link").length
    expected_result = 0
    equal logout_length, expected_result, "Expected: #{ expected_result }, got: #{ logout_length }"
    login_length = find("#login_link").length
    ok login_length >= 1, "Login link not found"