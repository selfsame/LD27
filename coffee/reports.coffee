

$(window).ready ->
	$.get './server/js/stderr.log', (data)->
		console.log "got report.."
		data = data.split("\n")
		entries = []
		for entry in data
			entries.push JSON.parse( entry)
		console.log entries
		#console.log data
