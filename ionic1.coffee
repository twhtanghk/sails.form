Renderer = require './renderer.coffee'

class Ionic1 extends Renderer
  formTemplate: ->
    """
      <div class="list">
        <%=htmls.join(separator)%>
      </div>
    """

  fieldTemplate: ->
    """
      <label class="item item-input">
        <span class="input-label"><%=name%></span>
        <input type="<%=type%>">
      </label>
    """

  fsTemplate: ->
    ""

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
