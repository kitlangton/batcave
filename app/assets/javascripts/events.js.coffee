# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#

$ ->
  $("#container").masonry
      itemSelector: ".box"
      columnWidth: 100
      isAnimated: true
      isFitWidth: true
      gutter: 30

  $("#history-container").masonry
      itemSelector: ".box"
      columnWidth: 100
      isAnimated: true
      isFitWidth: true

    $(".masonry-brick > .poster").click ->
      # $(this).siblings().removeClass "event-post"
      # $(this).siblings().addClass "event-pre"
      $(this).closest(".masonry-brick").toggleClass "event-pre"
      $(this).closest(".masonry-brick").toggleClass "event-post"
      $("#container").masonry "reload"
      $("#history-container").masonry "reload"

    # $("#add_band_form").bind "click", (e) ->
    #   row = $("div.new_band_row").clone().removeClass("hidden new_band_row")
    #   $("div.actions").before div


$(window).load ->
      $("#container").masonry "reload"
      $("#history-container").masonry "reload"
