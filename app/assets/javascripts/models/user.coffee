Revolution.User = DS.Model.extend(
  slug: DS.attr("string")
  username: DS.attr("string")

  posts: DS.hasMany 'post',
    async: true
  projectRoles: DS.hasMany 'projectRole',
    async: true
)