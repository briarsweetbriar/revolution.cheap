Revolution.ProjectsNewController = Ember.ObjectController.extend(
  needs: ['projects']

  Revolution.ProjectFormMixin

  Revolution.FormMixin,
    transitionTo: 'projects.show'
        
)