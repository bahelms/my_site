ready = ->
  $("#article_form").hide()
  $("#new_article").click ->
    $("#article_form").toggle ->
      (-> $(@).show())
      (-> $(@).hide())

jQuery -> ready()
$(document).on("page:load", ready)
