@selall = (h) ->
  $h = $ h
  $all = $ '.tr .l0 :checkbox'
  status = $h.prop 'checked'
  $all.prop 'checked', status

@multidel = () ->
  $all = $ '.tr .l0 :checkbox'
  delitem = (i for e, i in $all when $(e).is ':checked')
  if delitem.length
    alert "删除了第#{delitem}个元素"
  else
    alert '没删除元素'

$tabs = $('.m-page-topic-detail>.head>.l label.tab')
$oput = $('.m-page-topic-detail>.head>.r')
$pages = $('.tabpage')
$tabs.on 'change', () ->
  i = $tabs.index @
  $pages.hide()
  $pages.eq(i).show()
  if i is 0
    $oput.show()
  else
    $oput.hide()


chart0 = echarts.init $('.chart1w>.chart')[0]
colors = ['#5793f3', '#d14a61', '#675bba']
option = 
  color: colors
  tooltip: 
    trigger: 'none'
    axisPointer: 
      type: 'cross'
  grid: 
    left: 60
    top: 34
    right: 60
    bottom: 46
  xAxis:
    type: 'category',
    axisTick:
      alignWithLabel: true
    axisLine:
      onZero: false,
      lineStyle: 
        color: colors[1]
    data: ["2016-1", "2016-2", "2016-3", "2016-4", "2016-5", "2016-6", "2016-7", "2016-8", "2016-9", "2016-10", "2016-11", "2016-12"]
  yAxis: 
    type: 'value'
  series: [{
    type:'line'
    smooth: true
    data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
  }]
chart0.setOption(option)

chart1 = echarts.init $('.chart2w>.cont')[0]
option =
  color: ['#61a0a8']
  grid:
    left: 96
    right: 45
    top: 30
  xAxis:
    type: 'value'
  yAxis:
    type: 'category'
    data: ['人民日报','BBC中文网','新浪微博','腾讯微博','独立博客']
  series: [{
    name: '直接访问'
    type: 'bar'
    stack: '总量'
    label: 
      normal:
        show: true,
        position: 'insideRight'
    data: [820,832,901,934,1290]
  }]
chart1.setOption(option)
