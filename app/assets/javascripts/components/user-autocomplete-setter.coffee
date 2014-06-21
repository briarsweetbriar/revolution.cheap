Revolution.UserAutocompleteSetterComponent = Em.Component.extend

  tagName: 'span'
  searchInput: null
  usedObject: null

  setSearchInput: (->
    username = @get 'targetObject.content.user.username'
    @set('searchInput', username)
  ).on('didInsertElement')

  users: (->
    input = @get 'searchInput'
    user = @get 'targetObject.user'
    if input? && input.length > 2 && (!user? || input != user.get('username'))
      @store.findQuery 'user',
        username: input
  ).property('searchInput')

  actions:
    setUser: (user) ->
      formObject = @get('targetObject')
      formObject.set("user", user)
      @set('searchInput', user.get('username'))