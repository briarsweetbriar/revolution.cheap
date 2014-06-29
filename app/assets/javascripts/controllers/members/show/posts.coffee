Revolution.MembersShowPostsController = Ember.ArrayController.extend(
  sortAscending: false
  sortProperties: ["createdAt"]

  itemController: 'post'

  activeTags: Ember.A()
  cinched: false
)