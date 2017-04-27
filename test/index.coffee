util = require 'util'
sailsForm = require '../index'
model = require('./model.coffee').attributes

describe 'sails form', ->
  it 'attrs', ->
    console.log util.inspect sailsForm.attrs model

  it 'model', ->
    console.log util.inspect sailsForm.model model

  it 'form', ->
    console.log util.inspect sailsForm.form model

  it 'html', ->
    console.log util.inspect sailsForm.html model

