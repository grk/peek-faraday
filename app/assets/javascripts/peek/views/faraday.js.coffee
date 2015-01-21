$(document).on 'peek:render', (e, requestId, results) ->
  requestList = $('#peek-faraday-details > ul')
  requestList.empty()
  for request in results.data['faraday'].requests
    li = $('<li></li>').appendTo(requestList).attr('title', request.callstack).tipsy()
    $('<span class="peek-faraday-request-duration"></span>').appendTo(li).text(request.duration + "ms")
    $('<span class="peek-faraday-request-method"></span>').appendTo(li).text(request.method)
    $('<span class="peek-faraday-request-path"></span>').appendTo(li).text(request.path)

$(document).on 'click', '#peek-faraday-details-toggle', ->
  $('#peek-faraday-details').toggle()
