targetUrl = 'http://www.contract.reins.or.jp/search/displayAreaConditionBLogic.do'

casper = require('casper').create()

casper.start targetUrl

# select prefecture
casper.then ->
  @evaluate ->
    prefecture = document.querySelector('select#Address03')
    prefecture.value = '14'
    e = document.createEvent('HTMLEvents')
    e.initEvent('change', false, true)
    prefecture.dispatchEvent(e)

# select region
casper.then ->
  @evaluate ->
    region = document.querySelector('select#Address04')
    region.value = 'A1402'
    e = document.createEvent('HTMLEvents')
    e.initEvent('click', false, true)
    region.dispatchEvent(e)

# remove alert and submit
casper.then ->
  @evaluate ->
    form = document.forms[0]
    setNames 1
    form.event.value = 'forward_searchContract'
    form.submit()

casper.then ->
  @echo(@getPageContent())

casper.run ->
  @exit()

