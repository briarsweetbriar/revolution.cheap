Revolution.Post = DS.Model.extend(
  createdAt: DS.attr("date")
  body: DS.attr("string")
  slug: DS.attr("string")
  title: DS.attr("string")

  user: DS.belongsTo 'user',
    async: true

  bodyReduced: (->
    @get('body').substring(0, 500) if @get('body')
  ).property('body')
)