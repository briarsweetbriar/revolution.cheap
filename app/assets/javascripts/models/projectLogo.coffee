Revolution.ProjectLogo = DS.Model.extend(
  file: DS.attr("string")

  project: DS.belongsTo("project")
)