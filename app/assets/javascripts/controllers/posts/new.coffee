Revolution.PostsNewController = Ember.ObjectController.extend(
  needs: ['posts']

  Revolution.FormMixin,
    transitionTo: 'posts.show'
        
)