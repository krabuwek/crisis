document.addEventListener("turbolinks:load", ->
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

  $(".go-top").click ->
    $("html body").animate({ scrollTop: 0 },  400)

) 
#$("html, body").animate({ scrollTop: 0 }, 600);