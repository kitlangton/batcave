deferImage = (element) ->
  i = undefined
  len = undefined
  attr = undefined
  img = new Image()
  placehold = element.children[0]
  element.className += " is-loading"
  img.onload = ->
    element.className = element.className.replace("is-loading", "is-loaded")
    element.replaceChild img, placehold
    return

  i = 0
  len = placehold.attributes.length

  while i < len
    attr = placehold.attributes[i]
    img.setAttribute attr.name.replace("data-", ""), attr.value  if attr.name.match(/^data-/)
    i++
  return
