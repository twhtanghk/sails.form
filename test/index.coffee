util = require 'util'
Form = require '../index.coffee'

describe 'sails form', ->
  ['./model1.coffee', './model2.coffee'].map (name) ->
    it name, ->
      form = new Form 
        model: require name
        include: ['name', 'disk', 'memory']
      console.log util.inspect form.html()
