jQuery ->
  $("#write_post").click ->
    if @?
      @.hide
    else
      @.show
