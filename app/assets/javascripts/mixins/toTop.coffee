Revolution.ToTopMixin = Ember.Mixin.create(
  didInsertElement: ->
    @._super()
    if $("#header").offset().top > $(".logo").outerHeight(true)
      $('html, body').scrollTop $(".main").offset().top - $("#header").outerHeight(true)

)