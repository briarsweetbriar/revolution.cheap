Revolution.Project = DS.Model.extend(
  description: DS.attr("string")
  slug: DS.attr("string")
  source: DS.attr("string")
  title: DS.attr("string")
  website: DS.attr("string")

  logo: DS.belongsTo("projectLogo")
  slideshow: DS.belongsTo("slideshow")
  projectRoles: DS.hasMany "projectRole",
    async: true
)