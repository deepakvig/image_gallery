# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('.ih').hover( ->
    $ih = $(this)
    $ih.find('.ih-info').stop(true,true).animate({opacity:0.8}, 400)
  , ->
    $ih = $(this)
    $ih.find('.ih-info').stop(true,true).animate({opacity:0}, 400)
  ).find('.ih-info').css('opacity',0)


$(document).ready -> 
  $("#photo img").each ->
    $this = $(this)
    title = $this.attr("alt")
    $this.after '<div id="caption">'+title+'</div>'
  $('#caption').hide()
  $('#photo').hover( -> 
    $('#caption', this).slideDown('slow')
  , ->
    $('#caption', this).slideUp('slow') 
  )

