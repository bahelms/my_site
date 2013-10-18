ready = ->
  $("#article_form").hide()
  $("#new_article").click ->
    $("#article_form").toggle ->
      (-> $(@).show())
      (-> $(@).hide())

jQuery ->
  $("#article_form").hide()
  $("#new_article").click ->
    $("#article_form").toggle ->
      (-> $(@).show())
      (-> $(@).hide())
$(document).on("page:load", ready)
