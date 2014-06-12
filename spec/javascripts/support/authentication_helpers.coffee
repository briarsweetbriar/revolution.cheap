this.login = ->
  visit("/login").fillIn("#identification", "user@email.com").fillIn("#password", "password").click("#login_button")

this.logout = ->
  visit("/login").click("#logout_link") if $("#logout_link").length > 0