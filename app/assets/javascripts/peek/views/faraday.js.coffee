$(document).on 'peek:render', (e, requestId, results) ->
  requestList = $('#peek-faraday-details > ul')
  requestList.empty()
  for request in results.data['faraday'].requests
    li = $('<li class="peek-faraday-request"></li>').appendTo(requestList).attr('title', 'Click to toggle stacktrace').tipsy()
    $('<span class="peek-faraday-request-duration"></span>').appendTo(li).text(request.duration + "ms")
    $('<span class="peek-faraday-request-method"></span>').appendTo(li).text(request.method)
    $('<span class="peek-faraday-request-path"></span>').appendTo(li).text(request.path)
    $('<span class="peek-faraday-request-callstack" style="display:none"></span>').appendTo(li).text(request.callstack)

$(document).on 'click', '#peek-faraday-details-toggle', ->
  $('#peek-faraday-details').toggle()

$(document).on 'click', '.peek-faraday-request', ->
  $(this).find(".peek-faraday-request-callstack").slideToggle()
