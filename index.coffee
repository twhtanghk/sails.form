_ = require 'lodash'
forms = require 'forms'
fields = forms.fields

module.exports =
  ###
  convert sails attribute type to caolan type
  ###
  type: (type) ->
    error = ->
      throw new Error "not supported type #{type}"
    switch type
      when 'text'
        'string'
      when 'integer'
        'number'
      when 'float'
        'number'
      when 'datetime'
        'date'
      when 'binary'
        error()
      when 'json'
        'string'
      when 'mediumtext'
        'string'
      when 'longtext'
        'string'
      when 'objectid'
        'string'
      else
        type
  
  ###
  convert sails attribute validator to caolan validator
  attr:
    type: 'string'
    required: true
    unique: true
  return:
    required: true
  ###
  validator: (attr) ->
    _.pick attr, 'required'

  ###
  convert sails attributes to caolan attribute
  attr:
    name:
      type: 'string'
      required: true
      unique: true
  return:
    name:
      fields.string required: true
  ###
  attrs: (attrs) ->
    iterator = (result, params, name) ->
      type = if params.type then module.exports.type params.type else 'string'
      result[name] = fields[type] module.exports.validator(params)
      result
    _.reduce attrs, iterator, {}

  ###
  convert sails model to caolan model
  model:
    attributes:
      attr1: ...
      attr2: ...
      ...
  include: [attribute1, attribute2, ...] or null to include all
  exclude: [attribute1, attribute2, ...] or null to exclude nothing
  ###
  model: (model, exclude = null, include = '__all__') ->
    model = _.omit model, exclude
    if include != '__all__'
      model = _.pick model, include
    module.exports.attrs model
 
  form: (model, exclude = null, include = '__all__') ->
    forms.create module.exports.model model, include, exclude

  html: (model, exclude = null, include = '__all__') ->
    module.exports
      .form model, include, exclude
      .toHTML()
