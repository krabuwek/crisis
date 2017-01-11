document.addEventListener("turbolinks:load", ->
  $tags = $("#tags")
  $nextPageTags = $("#nextPageTags")
  $prevPageTags = $("#prevPageTags")
  $stepScroll = 100

  $nextPageTags.click ->
    currentScroll = $tags.scrollLeft()
    $tags.scrollLeft(currentScroll += $stepScroll)
    if $tags[0].scrollWidth - $tags[0].clientWidth <= currentScroll
      $(this).hide()
    if currentScroll > 0
     $prevPageTags.show()

  $prevPageTags.click -> 
    currentScroll = $tags.scrollLeft()
    $tags.scrollLeft(currentScroll -= $stepScroll)
    if currentScroll <= 0
      $(this).hide()
    if $tags[0].scrollWidth - $tags[0].clientWidth >= currentScroll
      $nextPageTags.show()
) 