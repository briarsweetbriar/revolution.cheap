Revolution.ProjectRole = DS.Model.extend(
  name: DS.attr("string")
  title: DS.attr("string")
  website: DS.attr("string")
  
  project: DS.belongsTo("project")
  user: DS.belongsTo "user",
    async: true
)