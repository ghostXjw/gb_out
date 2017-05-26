temparr = []
@linebtn = (h) ->
  $h = $ h
  $p = $h.parents '.table'
  $bs = $p.find '.i'
  $b0 = $bs.eq 0
  $b1 = $bs.eq 1
  $les = $p.find ':text'
  $tbody = $ '.table.tbody'
  toggle = ->
    isEdit = $b0.hasClass 'edit'
    $b0.removeClass 'edit yes'
    $b1.removeClass 'rm no'
    if isEdit
      $b0.addClass 'yes'
      $b1.addClass 'no'
    else
      $b0.addClass 'edit'
      $b1.addClass 'rm'
  if $h.hasClass 'edit'
    temparr = (i.value for i in $les)
    $les.prop 'disabled', false
    $tbody.has(':text:enabled').find('.i.no').click()
    toggle()
  else if $h.hasClass 'rm'
    if confirm '要删除吗'
      $p.remove()
  else if $h.hasClass 'yes'
    $les.prop 'disabled', true
    toggle()
  else if $h.hasClass 'no'
    $les.prop 'disabled', true
    $les.eq(i).val(val) for val, i in temparr
    toggle()
  if not (i.value for i in $les when i.value).length
    $p.remove()

@selall = (h) ->
  $h = $ h
  $all = $ '.table.tbody .l1 :checkbox'
  status = $h.prop 'checked'
  $all.prop 'checked', status


@multidel = () ->
  $tbody = $ '.table.tbody'
  delitem = (i for e, i in $tbody.has('.l1 :checked'))
  if delitem.length
    alert "删除了第#{delitem}个元素"
  else
    alert '没删除元素'
  $tbody.has('.l1 :checked').remove()

@dosearch = (e) ->
  if e.keyCode is 13 and @.value.trim()
    alert @.value

$thead = $ '.table.thead'
tpl = Handlebars.compile $('#tbodyTemplate').html()
option = 
  num: 1
  name: '低俗文化'
  location: '江苏 南京 徐州 苏州 宿迁 江苏 南京 徐州 苏州 宿迁'
  people: '王二 张三 李四'
  event: '低俗文化 小广告 低俗文化 小广告'
  exclude: '旅游 旅游 旅游 旅游'
$thead.after tpl option for i in [0..4]

@addnew = () ->
  $tbody = $ '.table.tbody'
  $newline = $ tpl
    num: 1
    name: ''
    location: ''
    people: ''
    event: ''
    exclude: ''
  $newline.find('.i.edit').click()
  $thead.after $newline