$ ->
  widgetIframe = document.getElementById("sc-widget")
  widget = SC.Widget(widgetIframe)
  widget.bind SC.Widget.Events.READY, ->
    widget.bind SC.Widget.Events.PLAY, ->
      widget.getCurrentSoundIndex (index) ->
        $(".band-show").removeClass("red")
        $(".band-show:eq( #{index} )").addClass("red")

  $(".band-show").click ->
    bandname = $(this).attr("alt")
    widget.load("https://soundcloud.com/#{bandname}")
