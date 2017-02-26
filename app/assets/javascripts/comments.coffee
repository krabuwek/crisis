document.addEventListener("DOMContentLoaded", -> 
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    $("#comment_content").val("")
  )
  $("#new_response").on("ajax:success", (e, data, status, xhr) ->
    $("#response_content").val("")
  )
  $("#go-registration").click ->
    body = $("html body")
    body.stop().animate({ scrollTop: 134 }, '500', 'swing', ->
      $("#registration").slideToggle("slow")
    )
#     #     $("#new_comment").append xhr.responseText
#     #   ).on "ajax:error", (e, xhr, status, error) ->
#     #     $("#new_comment").append "<p>ERROR</p>"
)