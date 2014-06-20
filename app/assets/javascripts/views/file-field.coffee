Revolution.FileFieldView = Em.View.extend(

  templateName: 'views/file-field'

  parentObject: null
  recordType: null

  recordName: (->
    "#{ @get('recordType').underscore() }[file]"
  ).property('recordType')

  recordTypePlural: (->
    inflector = new Ember.Inflector(Ember.Inflector.defaultRules)
    inflector.pluralize @get('recordType')
  ).property('recordType')

  didInsertElement: ->
    $('#file_upload').attr("name", @get("recordName"))
    $('#file_upload').fileupload
      url: "/" + @get('recordTypePlural').underscore()
      dataType: "json"
      beforeSend: ->
        $(".progress-bar").css "width", "0%"
      success: (response) =>
        recordType = @get('recordType')
        upload = @get("parentView.controller").store.createRecord(recordType, response[recordType.underscore()])
        @get('parentObject').set(recordType, upload)
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $(".progress-bar").css "width", progress + "%"

)