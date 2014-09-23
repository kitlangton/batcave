
do_on_load = ->
  widgetIframe = $("iframe")[0]
  widget = SC.Widget(widgetIframe)
  widget.bind SC.Widget.Events.READY, ->
    widget.bind SC.Widget.Events.PLAY, ->
      widget.getCurrentSoundIndex (index) ->
        $(".band-show").removeClass("red")
        $(".band-show:eq( #{index} )").addClass("red")

$(document).ready(do_on_load)
$(window).bind('page:change', do_on_load)
