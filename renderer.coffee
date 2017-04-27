_ = require 'lodash'

class Renderer
  constructor: (opts = {}) ->
    _.extend @, opts

  fieldHtml: (form, name, value) ->
    template = _.template @fieldTemplate()
    attr = form.model.attributes[name]
    data =
      name: name
      value: value
      type: @type(attr.type || attr.model || attr.collection)
    template _.defaults data, form.model.attributes[name]

  html: (form, values = {}) ->
    attrs = _.omit form.model.attributes, form.exclude
    if form.include != '__all__'
      attrs = _.pick attrs, form.include
    htmls = _.map attrs, (attr, name) =>
      @fieldHtml form, name, values[name]
    template = _.template @formTemplate()
    template htmls: htmls, separator: @fsTemplate()

module.exports = Renderer
