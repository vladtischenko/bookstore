# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#ship_as_bill').on 'click', ->
    if $(@).is ':checked'
      $('div#ship_block').css("visibility","hidden")
    else
      $('div#ship_block').css("visibility","visible")

  $("input[type='radio']").on 'click', ->
    if $('#shipping_ground').is ':checked'
      $('#shipping_value').text '5.00 not saved'
      $('#shipping_value').css 'color', 'red'
    if $('#shipping_two_days').is ':checked'
      $('#shipping_value').text '10.00 not saved'
      $('#shipping_value').css 'color', 'red'
    if $('#shipping_one_day').is ':checked'
      $('#shipping_value').text '15.00 not saved'
      $('#shipping_value').css 'color', 'red'
