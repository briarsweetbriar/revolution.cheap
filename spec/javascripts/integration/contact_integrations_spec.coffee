module "contact integration"

test "contact page", ->
  visit "/contact"
  andThen ->
    input_fields = find(".form-fields li").length
    ok input_fields >= 1, "Input field not found"

test "submitting the contact form with invalid attributes", ->
  visit "/contact" 
  andThen ->
    fillIn "input[name='name']", "Invalid Contact"
    click "#submit_button"
    andThen ->
      error_text = find(".error-block li").text()
      expected_result = "is invalid"
      equal error_text, expected_result, "Expected: #{ expected_result }, got: #{ error_text }"

test "submitting to the contact form redirects to contact.thanks page", ->
  visit "/contact"
  andThen ->
    fillIn "input[name='name']", "Valid Contact"
    click "#submit_button"
    andThen ->
      header_text = find("h1").text()
      expected_result = "Thanks!"
      equal header_text, expected_result, "Expected: #{ expected_result }, got: #{ header_text }"
