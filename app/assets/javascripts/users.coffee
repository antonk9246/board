# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#comments-link').click ->
    $('#comments-form').fadeToggle()
    
$ ->
  $('#new-ad-link').click ->
    $('#new-ad-form').fadeToggle()


