Revolution.ProjectsController = Ember.ArrayController.extend(
  sortAscending: false
  sortProperties: ["createdAt"]

  itemController: 'project'

  activeTags: Ember.A()
  cinched: false
)