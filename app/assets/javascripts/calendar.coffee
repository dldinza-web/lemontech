# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Calendar = {
  load: ->
    $.get('calendar/load',
      { owner: 'Daniel' },
      Item.renderAll,
      'json'
    )

  findCell: (day, initTime)->
    cell = $('div[data-weekday="' + day + '"] div[data-time="' + initTime + '"]')[0]
    if cell != undefined then $(cell) else cell
}

Item = {
  renderAll: (calItems) ->
    $.each(calItems, (day, items) ->
      $.each(items, (index, item) ->
        $cell = Calendar.findCell(day, item.hora_inicio)

        if $cell
          $cell.html Item.renderEvent(item)
      )
    )

  renderEvent: (item) ->
    $cell = $('<div>')
      .addClass('item item-scheduled')
      .text(item.nombre)
      .prepend('<img src="/assets/images/calendar.png" /> ')

    this.setDurationTime($cell, item)

    $cell

  setDurationTime: ($cell, item) ->
    d = new Date()
    startsAt = Date.parse(d.getFullYear() + '/' + d.getMonth() + '/' + d.getDate() + ' ' + item.hora_inicio)
    endsAt = Date.parse(d.getFullYear() + '/' + d.getMonth() + '/' + d.getDate() + ' ' + item.hora_termino)

    diffMs = endsAt - startsAt
    minutes = diffMs / 1000 / 60
    blocks = minutes / 30

    height = 14 * blocks + 7 * (blocks - 1)
    $cell.css('height', height + 'px')
}

$(document).ready ->
  Calendar.load()
