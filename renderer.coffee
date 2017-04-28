_ = require 'lodash'

class Renderer
  constructor: (opts = {}) ->
    _.extend @, opts

  fieldValidHtml: (form, name, value) ->
    attr = form.model.attributes[name]
    @fieldValidTemplate()(validate: _.pick attr, 'min', 'max')
    
  fieldHtml: (form, name, value) ->
    attr = form.model.attributes[name]
    data =
      name: name
      value: value
      type: @type(attr.type || attr.model || attr.collection)
      valid: @fieldValidHtml form, name, value
    @fieldTemplate()(_.defaults data, form.model.attributes[name])

  html: (form, values = {}) ->
    attrs = _.omit form.model.attributes, form.exclude
    if form.include != '__all__'
      attrs = _.pick attrs, form.include
    htmls = _.map attrs, (attr, name) =>
      @fieldHtml form, name, values[name]
    @formTemplate()({htmls: htmls, separator: @fsTemplate()})

module.exports = Renderer
