document.addEventListener("turbolinks:load", ->
  $("#new_article").submit -> 
    form = $(this)
    tag_list = form.find("#article_tags").val().split(/\ +/)
    $.each(tag_list, (key, value) =>
      console.log($(this.this))
      console.log(key + ":" + value)
      #console.log(form)
      form.append("<input type='hidden' name='tags[#{key}]' value='#{value}'>")
    )
    console.log(tag_list)
)