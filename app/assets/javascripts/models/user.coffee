Revolution.User = DS.Model.extend(
  slug: DS.attr("string")
  username: DS.attr("string")

  projectRoles: DS.hasMany 'projectRole',
    async: true
)