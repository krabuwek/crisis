document.addEventListener("turbolinks:load", ->
  $("#article_form").submit -> 
    form = $(this)
    tag_list = form.find("#article_tag_list").val().split(/\ +/)
    $.each(tag_list, (key, value) =>
      form.append("<input type='hidden' name='tags[#{key}]' value='#{value}'>")
    )
    console.log(tag_list)
)
