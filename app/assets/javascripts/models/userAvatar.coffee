Revolution.UserAvatar = DS.Model.extend(
  file: DS.attr()

  user: DS.belongsTo("user")
)