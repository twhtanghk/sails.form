_ = require 'lodash'
Renderer = require './ionic1.coffee'
ionic1 = new Renderer()

class Form
  include: '__all__'

  exlcude: []

  ###
  opts:
    model:
      attributes:
        name:
          type: 'string'
        ...
    include: [attr1, attr2, ...] or '__all__' to include all attributes
    exclude: [attr1, attr2, ...] or null to exclude none
  ###
  constructor: (opts = {}) ->
    if not ('model' of opts)
      throw new Error 'model definition not yet defined for model form'

    _.extend @, opts

  html: (values = {}, renderer = ionic1) ->
    renderer.html @, values

module.exports = Form
