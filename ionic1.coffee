_ = require 'lodash'
Renderer = require './renderer.coffee'

class Ionic1 extends Renderer
  formTemplate: ->
    _.template """
      <div class="list">
        <%=htmls.join(separator)%>
      </div>
    """

  fieldTemplate: ->
    _.template """
      <label class="item item-input">
        <span class="input-label"><%=name%></span>
        <input type="<%=type%>" <%=valid%> ng-model="model.<%=name%>">
      </label>
    """

  fieldValidTemplate: ->
    _.template """
      <% if ('min' in validate) { %>
        min="<%=validate.min%>"
      <% } %>
      <% if ('max' in validate) { %>
        max="<%=validate.max%>"
      <% } %>
    """

  fsTemplate: ->
    _.template ""
  
  type: (type) ->
    switch type
      when 'integer'
        'number'
      when 'float'
        'number'
      when 'date'
        'date'
      when 'datetime'
        'date'
      else
        'text'
  
module.exports = Ionic1
