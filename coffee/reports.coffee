

$(window).ready ->

	do_group = (stamp)->
		time = stamp.split('T')[1].split('.')[0]
		atime = time.split(':')
		h = atime[0]
		m = atime[1]
		s = atime[2]

		if $('body').children('.h'+h).length > 0
			$h = $('body').children('.h'+h)
		else
			$h = $('<div class="' + 'h'+h + ' hour"></div>')
			$('body').append $h

		if $h.children('.m'+m).length > 0
			$m = $h.children('.m'+m)
		else
			$m = $('<div class="' + 'm'+m + ' minute"></div>')
			$h.append $m

		if $m.children('.s'+s).length > 0
			$s = $m.children('.s'+s)
		else
			$s = $('<div class="' + 's'+s + ' second "></div>')
			$m.append $s

		return atime

	$.get './server/js/stderr.log', (data)->
		console.log "got report.."
		data = data.split('{"date":')
		entries = []
		for entry in data
			if entry isnt ''

				entry = '{"date":'+entry

				obj = JSON.parse( entry)
				entries.push obj
				time = do_group(obj.timestamp)
				console.log time
				console.log $('.h'+time[0]).children('.m'+time[1]).children('.s'+time[2])
				$('.h'+time[0]).children('.m'+time[1]).children('.s'+time[2]).append $('<p class="err"><span class="time">'+time+'  </span>'+obj.message+'</p>')

				
		console.log entries
		#console.log data

	$.get './server/js/console.log', (data)->

		data = data.split('{"level":')
		entries = []
		for entry in data
			if entry isnt ''

				entry = '{"level":'+entry

				obj = JSON.parse( entry)
				entries.push obj
				time = do_group(obj.timestamp)
				$('.h'+time[0]).children('.m'+time[1]).children('.s'+time[2]).append $('<p class="log"><span class="time">'+time+'  </span>'+obj.message+'</p>')	

				
		console.log entries
		#console.log data
