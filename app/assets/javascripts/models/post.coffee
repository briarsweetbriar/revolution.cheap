Revolution.Post = DS.Model.extend(
  Revolution.TaggableMixin
  
  createdAt: DS.attr("date")
  body: DS.attr("string")
  slug: DS.attr("string")
  title: DS.attr("string")

  user: DS.belongsTo 'user',
    async: true

  bodyReduced: (->
    @get('body').substring(0, 500) if @get('body')
  ).property('body')

  createdAtMoment: (->
    moment(@get('createdAt')).format('MMMM Do, YYYY')
  ).property('createdAt')
)