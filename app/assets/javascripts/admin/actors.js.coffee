jQuery ->
  $('ul.nav-tabs li a').click (e)->
    e.preventDefault()
    $(this).tab('show')
