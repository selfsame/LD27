Array::remove = (item)->
	indx = @indexOf(item)
	if indx != -1
		return @.splice(indx,1)

ws = new WebSocket('ws://'+window.location.hostname+':8079') 

ws.onmessage = (message)->
	data = JSON.parse(message.data)	
	if not data.debrief
		console.log data
	if data.disconnect?
		if $('#'+data.disconnect)[0]?
			$('#'+data.disconnect).detach()
	else if data.connect?
		player = data.connect
		if not $('#'+player.ID)[0]?
			
			avatar = $('<div class="player", id="'+player.ID+'"></div>')
			avatar.css 
				width: player.w
				height:player.h
				'background-color':'gray'
				position:'absolute'
				left:player.x
				top:player.y
			$('#viewport').append avatar
	else if data.chat?
		if $('#'+data.who)[0]?
			bubble = $('<p class="bubble" >'+data.chat+'</p>')
			$('#'+data.who).html bubble
			bubble.css('margin-top', -1*bubble.height() - 15)
			bubble.delay(2000).animate {opacity:0.0}, 300, ()->
				bubble.deatch()
	else if data.load?
		console.log 'load'
		n = data.load
		$.get './levels/level'+n+'.html', (data)->
			$('#viewport').html data
	else if data.debrief?
		for player in data.debrief
			if not $('#'+player.ID)[0]?
				avatar = $('<div class="player", id="'+player.ID+'"></div>')
				avatar.css 
					width: player.w
					height:player.h
					'background-color':'gray'
					position:'absolute'
					left:player.x
					top:player.y
				$('#viewport').append avatar
			else
				avatar = $('#'+player.ID)
				avatar.css 
					left:player.x
					top:player.y





window.keys = []
$(window).keydown (e)->
	if $('#chat').is(':focus')
		if e.keyCode is 13
		
			ws.send(JSON.stringify({'chat':$('#chat').val()}))
			$('#chat').val('')
	else if e.keyCode not in window.keys
		window.keys.push e.keyCode
		ws.send(JSON.stringify({'keydown':e.keyCode}))
$(window).keyup (e)->
	window.keys.remove e.keyCode
	ws.send(JSON.stringify({'keyup':e.keyCode}))

window.compile_level = (url)->
	$.get './levels/'+url, (data)->
		result = []
		temp = $('<div></div>')
		temp.append $(data)
		recurse = (el)->
			if not $(el).hasClass 'no_collision'
				b =
					x: parseInt($(el).css('left'))
					y: parseInt($(el).css('top'))
					w: parseInt($(el).outerWidth())
					h: parseInt($(el).outerHeight())
				result.push b
				for child in $(el).children()
					recurse(child)
		for child in $(temp).children()
			recurse(child)
		console.log JSON.stringify(result)

