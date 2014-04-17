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
    $('#shipping_value').text $(@).data('price')
    if $(@).data('coupon')
      value = Math.round((parseFloat($('#subtotal_value').text()) - parseFloat($(@).data('coupon')) + parseFloat($(@).data('price')))*100)/100
    else
      value = Math.round((parseFloat($('#subtotal_value').text()) + parseFloat($(@).data('price')))*100)/100  
    $('#order_total_value').text value

  $('#card_number_id').on 'keyup', ->
    if !$(@).val().match(/[\d]{16}/)
      $('#card_number').html('<span>card number should contain only numbers and it length should be 16</span>')
    else
      $('#card_number').html('')

  $('#cvv_id').on 'keyup', ->
    if !$(@).val().match(/[\d]{3}/)
      $('#cvv_code').html('<span>cvv code should contain only numbers and it length should be 3</span>')
    else
      $('#cvv_code').html('')

  $('#credit_card_expiration_month').on 'change', ->
    do checke_date  

  $('#credit_card_expiration_year').on 'change', ->
    do checke_date

  checke_date = () ->
    month = $('#credit_card_expiration_month').val()
    year = $('#credit_card_expiration_year').val()
    months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December']
    date_now = new Date()
    if parseInt(year) == date_now.getUTCFullYear()
      if months.indexOf(month) >= date_now.getMonth()
        $('#exp_date').html('')
      else
        $('#exp_date').html("<span>expiration date can't be in the past</span>")
    else
      $('#exp_date').html('')
    