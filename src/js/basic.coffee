$ '.datetime'
  .flatpickr
    enableTime: true
    locale: 'zh'
    time_24hr: true

$ document
  .on 'keyup', (e) ->
    if e.keyCode == 27
      $ '.m-fwin'
        .hide()

$ '.m-selector'
  .on 'mousedown', '.item', (e) ->
    $cur = $ e.currentTarget
    $parent = $ e.delegateTarget
    $ipt = $parent.find ':text'
    $ipt.val $cur.text()