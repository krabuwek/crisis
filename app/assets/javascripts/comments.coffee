document.addEventListener("turbolinks:load", -> 
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    $("#comment_content").val("")
  )
  $("#new_response").on("ajax:success", (e, data, status, xhr) ->
    $("#response_content").val("")
  )
  
#     #     $("#new_comment").append xhr.responseText
#     #   ).on "ajax:error", (e, xhr, status, error) ->
#     #     $("#new_comment").append "<p>ERROR</p>"
)