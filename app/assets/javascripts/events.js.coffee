# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
# #
# #

$ ->
  Mousetrap.bind "command+b", (e) ->
    $(".hidden:first").removeClass("hidden").addClass("new")
    $(".typeahead:visible:last").focus()



$ ->
  $("#add_band_form").click ->
    $(".hidden:first").removeClass("hidden")
    # div = $(".duplicate").clone().removeClass("duplicate")
    # $(".duplicate .typeahead").val ""
    # $(".duplicate").before div

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






$(window).load ->
      $("#container").masonry "reload"
      $("#history-container").masonry "reload"


