Revolution.ProjectLogo = DS.Model.extend(
  file: DS.attr()

  project: DS.belongsTo("project")
)