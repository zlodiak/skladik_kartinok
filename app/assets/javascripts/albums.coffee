# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#new_album").on("ajax:success", (e, data, status, xhr) ->
    $("#new_album").append xhr.'<p>album add successfull</p>'
   ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_album").append "<p>ERROR</p>"

