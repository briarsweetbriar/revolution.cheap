Revolution.Tag = DS.Model.extend(
  name: DS.attr('string')
  postsCount: DS.attr('number')
  projectsCount: DS.attr('number')
  slug: DS.attr('string')

  posts: DS.hasMany 'post',
    async: true
  projects: DS.hasMany 'project',
    async: true
)