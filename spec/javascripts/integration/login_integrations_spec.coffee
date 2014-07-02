module "login integration"

test "login page", ->
  visit "/login"
  andThen ->
    header_text = find("h1").text()
    expected_result = "Login"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "The logout button is only visible when logged in", ->
  visit("/projects")
  andThen ->
    logout_length = find("#logout_link").length
    expected_result = 0
    equal logout_length, expected_result, "Expected: #{ expected_result }, got: #{ logout_length }"