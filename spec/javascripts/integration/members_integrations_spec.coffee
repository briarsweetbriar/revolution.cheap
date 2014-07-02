module "members integration"

test "about_us page", ->
  visit "/about_us"
  andThen ->
    header_text = find("h1:first").text()
    expected_result = "User 1"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"

test "renders members", ->
  visit "/about_us"
  andThen ->
    users_length = find(".members-list li").length
    equal users_length, 2, "Expected members to contain 2 items, got: #{ users_length }"

test "Visiting a member via the index screen", ->
  visit("/about_us").click "ul li:last a"
  andThen ->
    contact = find("h1").text()
    expected_result = "User 2"
    equal contact, expected_result, "Expected: #{ expected_result }, got: #{ contact }"

test "renders member", ->
  visit "/members/user_1"
  andThen ->
    header_text = find("h1").text()
    expected_result = "User 1"
    equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"