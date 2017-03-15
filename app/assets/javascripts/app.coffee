document.addEventListener("DOMContentLoaded", ->
  $tags = $("#tags")
  $nextPageTags = $("#nextPageTags")
  $prevPageTags = $("#prevPageTags")
  $stepScroll = 300

  $nextPageTags.click ->
    currentScroll = $tags.scrollLeft()
    $tags.animate({ scrollLeft: (currentScroll += $stepScroll) }, 600)
    console.log(currentScroll)
    #$tags.scrollLeft(currentScroll += $stepScroll)
    if $tags[0].scrollWidth - $tags[0].clientWidth <= currentScroll
      $(this).hide()
    if currentScroll > 0
     $prevPageTags.show()

  $prevPageTags.click -> 
    currentScroll = $tags.scrollLeft()
    $tags.animate({ scrollLeft: currentScroll -= $stepScroll }, 600)
    #$tags.scrollLeft(currentScroll -= $stepScroll)
    if currentScroll <= 0
      $(this).hide()
    if $tags[0].scrollWidth - $tags[0].clientWidth >= currentScroll
      $nextPageTags.show()

  # $(".go-top").click ->
  #   $("html body").animate({ scrollTop: 0 },  400)

  top_show = 200
  delay = 400

  $('.go-top').click ->
      $('body, html').animate({
        scrollTop: 0
      }, delay);

  
  $(window).scroll ->
    windowScrollTop = $(window).scrollTop()
    windowHeight = $(window).outerHeight()

    console.log($(this).scrollTop() > top_show)

    if windowScrollTop > top_show
      $('.go-top').fadeIn();
    else 
      $('.go-top').fadeOut();
);