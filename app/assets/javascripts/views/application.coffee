Revolution.ApplicationView = Em.View.extend(

  didInsertElement: ->
    $('#header').scrollToFixed()
)