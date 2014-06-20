# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

Revolution.ApplicationStore = DS.Store.extend({

})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
Revolution.ApplicationAdapter = DS.ActiveModelAdapter.extend({

})


Revolution.inject('component', 'store', 'store:main')
Revolution.inject('view', 'store', 'store:main')

Revolution.ProjectSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs:
    projectRoles:
      embedded: "always"
)