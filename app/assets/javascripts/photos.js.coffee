# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  if $('#new_photo').length > 0
    $('#new_photo').fileupload
      dataType: "script"
      add: (e, data) ->
        console.log "Enter"
        types = /(\.|\/)(gif|jpe?g|png)$/i
        file = data.files[0]
        if types.test(file.type) || types.test(file.name)
          data.context = $(tmpl("template-upload", file))
          $('#new_photo').append(data.context)
          data.submit()
        else
          alert("#{file.name} is not a gif, jpeg, or png image file")
      progress: (e, data) ->
        console.log "Entered"
        if data.context
          progress = parseInt(data.loaded / data.total * 100, 10)
          data.context.find('.bar').css('width', progress + '%')

  if $(".tiles").length > 0
    $(".tiles").tilesGallery
      width: 800,
      height: 500,
      margin: 5,
      caption: true,
      captionOnMouseOver: true,
      callback: ->
        console.log "Clicked"
        $(".tiles a").lightBox();
   


