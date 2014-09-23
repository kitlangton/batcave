$(window).load ->
  $(".sc-holder").find(">:first-child").attr(id: "sc")
  widgetIframe = document.getElementById("sc")
  widget = SC.Widget(widgetIframe)
  widget.bind SC.Widget.Events.READY, ->
    widget.bind SC.Widget.Events.PLAY, ->
      widget.getCurrentSoundIndex (index) ->
        $(".band-show").removeClass("red")
        $(".band-show:eq( #{index} )").addClass("red")
