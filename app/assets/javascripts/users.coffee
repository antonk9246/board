# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $('#comments-link').click ->
    $('#comments-form').fadeToggle()
    
$(document).on "turbolinks:load", ->
  $('#new-ad-link').click ->
    $('#new-ad-form').fadeToggle()

$(document).on "turbolinks:load", ->
  $("#ads_items th a").click ->
    $.getScript $(this).attr('href')
    return false
