document.addEventListener("turbolinks:load", ->
  $("#article_form").submit -> 
    form = $(this)
    tag_list = form.find("#article_tag_list").val().split(/\ +/)
    $.each(tag_list, (key, value) =>
      form.append("<input type='hidden' name='tags[#{key}]' value='#{value}'>")
    )
    console.log(tag_list)
  script = "http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5878b92b77b16ed8"
  if window.addthis
    window.addthis = null;
  $.getScript(script);
)
