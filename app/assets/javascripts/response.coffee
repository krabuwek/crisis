# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("turbolinks:load", -> 
  # $('#add-response').click ->
  #   if $(this).hasClass('active')
  #     $(this).removeClass('active').addClass('unactive').html('Ответить');
  #     return
  #   $(this).removeClass('unactive').addClass('active').html('Убрать');
  $("#new_article").on("ajax:success", (e, data, status, xhr) ->
    $("#new_article").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"
)