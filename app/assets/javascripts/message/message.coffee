class Message
  constructor: (@text) ->

  to_html: ->
    """
<div class='message'>
  <p>#{@text}</p>
</div>
"""

window.Message = Message
