$(document).on 'ready page:load', ->
  $('textarea#message_text').keypress (e) ->
    if e.which == 13
      e.preventDefault()
      $(this).parents('form').submit()
      $(this).val('')
