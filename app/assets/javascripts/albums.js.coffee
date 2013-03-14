# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  randomXToY = (minVal, maxVal, floatVal) ->
    randVal = minVal + (Math.random() * (maxVal - minVal))
    (if typeof floatVal is "undefined" then Math.round(randVal) else randVal.toFixed(floatVal))
  $(".polaroid").each (i) ->
    tempVal = Math.round(Math.random())
    if tempVal is 1
      rotDegrees = randomXToY(330, 360)
    else
      rotDegrees = randomXToY(0, 30)
    if window.innerWidth is `undefined`
      wiw = 1000
      wih = 700
    else
      wiw = window.innerWidth
      wih = window.innerHeight
    cssObj =
      left: Math.random() * (wiw - 400)
      top: Math.random() * (wih - 400)
      "-webkit-transform": "rotate(" + rotDegrees + "deg)"
      transform: "rotate(" + rotDegrees + "deg)"

    $(this).css cssObj

  zindexnr = 1
  dragging = false
  $(".polaroid").mouseup (e) ->
    unless dragging
      zindexnr++
      cssObj =
        "z-index": zindexnr
        transform: "rotate(0deg)"
        "-webkit-transform": "rotate(0deg)"

      $(this).css cssObj

  $(".polaroid").draggable
    cursor: "crosshair"
    start: (event, ui) ->
      dragging = true
      zindexnr++
      cssObj =
        "box-shadow": "#888 5px 10px 10px"
        "-webkit-box-shadow": "#888 5px 10px 10px"
        "margin-left": "-10px"
        "margin-top": "-10px"
        "z-index": zindexnr

      $(this).css cssObj

    stop: (event, ui) ->
      tempVal = Math.round(Math.random())
      if tempVal is 1
        rotDegrees = randomXToY(330, 360)
      else
        rotDegrees = randomXToY(0, 30)
      cssObj =
        "box-shadow": ""
        "-webkit-box-shadow": ""
        transform: "rotate(" + rotDegrees + "deg)"
        "-webkit-transform": "rotate(" + rotDegrees + "deg)"
        "margin-left": "0px"
        "margin-top": "0px"

      $(this).css cssObj
      dragging = false



