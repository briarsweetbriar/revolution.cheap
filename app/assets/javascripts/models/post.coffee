Revolution.Post = DS.Model.extend(
  body: DS.attr("string")
  slug: DS.attr("string")
  title: DS.attr("string")

  user: DS.belongsTo 'user',
    async: true
)