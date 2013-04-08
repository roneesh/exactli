$ ->

  commentleft = 0
  commenttop = 0
  content = " "
  number_to_remove = 0
  id = 0
  to_rem_class = ""
  to_rem_objects = ""

  $(".image").on "click", (e) ->
    console.log e
    document_id = document_version_id
    unless $(e.target).hasClass("black") || $(e.target).hasClass("comment-entry") || $(e.target).hasClass("annotate-btn")
      commentleft = e.offsetX
      commenttop = e.offsetY
      form = "<form id='#{annotation_count}' style='left: #{e.offsetX}px; top: #{e.offsetY}px;' class='image-comment' action='#'>"
      text_input = "<input type='text' id='text' class='comment-entry' placeholder='Comment here' style='left: #{commentleft}px; top: #{commenttop}px;'>"
      submit = "<input type='submit' id='submit' class='submit-btn annotate-btn'>"
      cancel = "<button id='cancel' class='annotate-btn cancel-btn'>Cancel</button>"
      closers = "</form>" 
      $('.image-comment').remove()
      $(".image").append(form+text_input+submit+cancel+closers)

# Cancels the form
  $(".image").on "click", "#cancel", (e) ->
    $('.image-comment').remove()


# Creates annotation in db after user hits submit
  $(".image").on "click", "#submit", (e) ->
    annotation_text = $('#text').val()
    unless annotation_text == ""
      annotation_count += 1
      $('.image-comment').remove()
      # Creates the annotation in the db
      console.log($.ajax({
        url: "/annotation/create",
        type: "POST",
        data: { id : document_version_id, content: annotation_text, number: annotation_count, xcoor: commentleft, ycoor: commenttop }
      }))
    #   # Appends the comments section
      $(".image").append("<div class='black' style='left: #{commentleft}px; top: #{commenttop}px;'>#{annotation_count}</div>")
      $('.annotation-list').append("<li>#{annotation_count}. '#{annotation_text}'<br/><a id='delete' href='#'>Delete</a></li>")
      # Does a PUT request on DocumentVersion annotation_count  
      # console.log($.ajax({
        # url: "/increment_annotation_count/#{document_version_id}"
        # type: "PUT"
        # data: {annotation_count: annotation_count}
      # }))




# Deletes an annotation bubble if clicked
  # $("#image-area").on "click", ".black", (e) ->
  #   console.log(e)
  #   number_to_remove = $(e.target).attr("id")
  #   $(".\#{number_to_remove}").remove()
  #   console.log($.ajax({
  #     url: "/delete_annotation",
  #     type: "DELETE"
  #     data: {number: number_to_remove}
  #   }))

# Delete's annotation if Delete link clicked
  $('.comments').on "click", '#delete', (e) ->
    console.log e
    # to_rem_class = $(e.target).attr('class')
    # to_rem_objects = ".#{to_rem_class}"
    # $("#{to_rem_objects}").remove()
    # console.log($.ajax({
    #   url: "/delete_annotation/#{to_rem_class}",
    #   type: "DELETE"
    #   data: {number: to_rem_class}
    # }))

