$(document).ready ->
do_on_load = ->
  whiten = ->
    $(".rainbow").siblings().animate
      color: "rgb(300,300,300)"
      , 100
    return
  spectrum = ->
    hue = "rgb(" + (Math.floor(Math.random() * 256)) + "," + (Math.floor(Math.random() * 256)) + "," + (Math.floor(Math.random() * 256)) + ")"
    $(".rainbow").animate
      color: hue
    , 100
    return
  widgetIframe = $("iframe")[0]
  widget = SC.Widget(widgetIframe)
  widget.bind SC.Widget.Events.READY, ->
    widget.bind SC.Widget.Events.PLAY, ->
      widget.bind SC.Widget.Events.PLAY_PROGRESS, ->
        spectrum()
      widget.getCurrentSoundIndex (index) ->
  $(".band-show").click ->
    $(this).addClass("rainbow")
    $(this).siblings().removeClass("rainbow")
    whiten()
    index = $(this).index()
    widget.skip(index-1)
$(document).ready(do_on_load)
$(window).bind('page:change', do_on_load)

