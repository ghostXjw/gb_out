$progress = $ '.progress>.item'
$tab = $ '.m-tabs>.tab'
status = 0

@next = ->
  status++
  $progress.removeClass 'active'
  $progress.eq(status).addClass 'active'
  $tab.hide()
  $tab.eq(status).show()
  