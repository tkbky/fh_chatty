class GATracker
  @init: ->
    _gaq = _gaq or []
    _gaq.push [
      '_setAccount'
      'UA-66954312-1'
    ]
    _gaq.push [
      '_setDomainName'
      'none'
    ]
    _gaq.push [ '_trackPageview' ]
    do ->
      ga = document.createElement('script')
      ga.type = 'text/javascript'
      ga.async = true
      ga.src = (if 'https:' == document.location.protocol then 'https://ssl' else 'http://www') + '.google-analytics.com/ga.js'
      s = document.getElementsByTagName('script')[0]
      s.parentNode.insertBefore ga, s
      return

window.GATracker = GATracker
