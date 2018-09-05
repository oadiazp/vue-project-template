Vue.filter 'currency', (value) ->
  parseFloat(value).toLocaleString 'de-DE', minimumFractionDigits: 2, style: 'currency', currency: 'EUR'

Vue.filter 'status', (value) ->
  if value == 'N'
    gettext 'New'
  else if value == 'P'
    gettext 'Paid'
  else if value == 'W'
    gettext 'Waiting for documents'
  else if value == 'O'
    gettext 'On the consulate'
  else if value == 'R'
    gettext 'Returned'
  else
    gettext 'Done'
