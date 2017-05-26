$un = $ '[name=username]'
$pw = $ '[name=password]'
$rm = $ '[name=rememberme]'

$ ->
  username = localStorage.username
  password = localStorage.password
  if username and password
    $un.val username
    $pw.val password
    $rm.prop 'checked', true

@remember = ->
  username = $un.val().trim()
  password = $pw.val().trim()
  checked = $rm.prop 'checked'
  if checked and username and password
    localStorage.username = username
    localStorage.password = password
  else if not checked
    localStorage.removeItem 'username'
    localStorage.removeItem 'password'