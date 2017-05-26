@changeTo = (page) ->
  $ '.m-page-topiclib'
    .removeClass 'normal share rmall'
    .addClass page