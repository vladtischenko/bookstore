# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#ship_as_bill').on 'click', ->
    if $(@).is ':checked'
      $('div#ship_block').addClass 'hide'
    else
      $('div#ship_block').removeClass 'hide'

  $("input[type='radio']").on 'click', ->
    $('#shipping_value').text I18n.t('need_to_save')
    $('#shipping_value').addClass 'not-saved'
