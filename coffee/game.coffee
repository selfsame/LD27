ws = new WebSocket('ws://'+window.location.hostname+':8080') 

ws.onmessage = (message)->
	data = JSON.parse(message.data)
	console.log data
	if data.debrief
		for player in data.debrief
			if not $('#'+player.ID)[0]?
				avatar = $('<div class="player", id="'+player.ID+'"></div>')
				avatar.css 
					width:10
					height:10
					'background-color':'silver'
					position:'absolute'
					left:player.x
					top:player.y
				$('body').append avatar
	if data.disconnect
		if $('#'+data.disconnect)[0]?
			$('#'+data.disconnect).detach()
	if data.connect
		player = data.connect
		if not $('#'+player.ID)[0]?
			
			avatar = $('<div class="player", id="'+player.ID+'"></div>')
			avatar.css 
				width:10
				height:10
				'background-color':'silver'
				position:'absolute'
				left:player.x
				top:player.y
			$('body').append avatar
	if data.chat
		if $('#'+data.who)[0]?
			$('#'+data.who).html data.chat


$('#send').click (e)->
	ws.send(JSON.stringify({'chat':$('#chat').val()}))


