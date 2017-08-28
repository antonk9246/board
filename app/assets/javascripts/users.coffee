# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $('#comments-link').click ->
    $('#comments-form').fadeToggle()
    
$(document).on "turbolinks:load", ->
  $('#new-ad-link').click ->
    $('#new-ad-form').fadeToggle()

$(document).on 'turbolinks:load', ->
  $(document).on 'click', '#ads_items th a', ->
    $.getScript(this.href)
    false

$(document).on 'turbolinks:load', ->
  $(":submit").on 'ckick', ->
    $.getScript('/ads_items/search')
    false


