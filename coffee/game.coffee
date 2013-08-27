window.requestAnimFrame = (->
  window.requestAnimationFrame or window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or (callback) ->
    window.setTimeout callback, 1000 / 60
)()

Array::remove = (item)->
	indx = @indexOf(item)
	if indx != -1
		return @.splice(indx,1)


window.v_w = 800
window.v_h = 600

window.entities = {}
window.players = {}
window.dynamics = {}

window.me = false

short1 = new Audio("audio/short1.mp3")
coinwav = new Audio("audio/coin.wav")
coinlost = new Audio("audio/coinlost.wav")

$('#viewport').css
	width: window.v_w
	height: window.v_h

window.update_entities = ()->

	for key of window.entities
		e = window.entities[key]
		if e.avatar?


			if 'x' in e.to_update
				e.avatar.css
					left: parseInt(e.x)
			if 'y' in e.to_update
				e.avatar.css
					top: parseInt(e.y)
			if 'd' in e.to_update
				e.avatar.css
					transform: 'rotate(' + String(e.d * -1 ) + 'deg)'
			e.to_update = []
			if not $('.player.self').length > 0
				if e.ID is window.me
					e.avatar.addClass 'self'
					e.avatar.find('.playername').html e.name

	window.requestAnimFrame( update_entities )
	


connect_to_socket = (_name, _color)->
	ws = new WebSocket('ws://'+window.location.hostname+':8079') 
	console.log ws
	ws.onclose = ()->
		$('#socketstatus').removeClass 'socketon'
		$('#socketstatus').addClass 'socketoff'
		$('#socketstatus').html "disconnected"

	ws.onopen = ()->
		ws.onclose = ()->
		$('#socketstatus').removeClass 'socketoff'
		$('#socketstatus').addClass 'socketon'
		$('#socketstatus').html "connected"

		$('.connectbox').css('display','none')
		$('#connected').css('display', 'block')

		ws.send(JSON.stringify({'login':{name:_name, color:_color}}))

		$('#ping').css('display','block')
		$('#ping').click (e)->
			$('#ping').attr("disabled", "disabled")
			window.ping = new Date().getTime()
			ws.send(JSON.stringify({'ping':window.ping}))
	ws.onmessage = (message)->
		data = JSON.parse(message.data)	
		if data.pong?
			diff = new Date().getTime() - window.ping
			$('#pingresult').html diff+'ms'
			$('#ping').removeAttr("disabled")
		if data.time?
			$('.time').html(" " + (10 - parseInt(data.time)) )
		if data.self?
			window.me = data.self

		if data.disconnect?
			if $('#'+data.disconnect)[0]?
				$('#'+data.disconnect).detach()
		if data.remove?
			if $('#'+data.remove)[0]?
				$('#'+data.remove).detach()
		if data.collect?
			if data.collect is window.me
				coinwav.play()
			else
				coinlost.play()
			window.entities[data.collect].coin += 1
			window.entities[data.collect].avatar.find('.playerscore').html window.entities[data.collect].coin
		else if data.lobby?
			#$('#viewport').css('display', 'none')
			$('#actors').html('')
			$('#level').html('')
			$('#game').css
				'left':0
				'top':0
			$('#viewport > .time').hide()
			$('#viewport').addClass 'lobify'
			$('#lobby').css('display', 'block')
		else if data.chat?
			if $('#'+data.who)[0]?
				bubble = $('<p class="bubble" >'+data.chat+'</p>')
				$('#'+data.who).children('.chat').html bubble
				bubble.css('margin-top', -1*bubble.height() - 25)
				bubble.delay(2000).animate {opacity:0.0}, 300, ()->
					bubble.detach()
		else if data.load?
			short1.play()
			$('#lobby').css('display', 'none')
			$('#viewport').removeClass 'lobify'
			$('#viewport > .time').show()
			$('#viewport').css('display', 'block')

			n = data.load
			$('#dynamics').html('')
			$('#actors').html('')
			window.entities = {}
			$('#game').css
				'left':0
				'top':0
			$.get './levels/level'+n+'.html', (data)->
				$('#level').html data
				$('#level').find('.dynamic').detach()

		else if data.debrief? or data.connect?
			set = data.debrief or data.connect
			$('#debug').html '<p>packet length: '+JSON.stringify(set).length+'  '+'</p>'
			for entity in set
				if entity.ID
					if not window.entities[entity.ID]

						window.entities[entity.ID] = entity
						if entity.t? and entity.t is true
							avatar = $('<div class="player dynamic", id="'+entity.ID+'">
								</div>')
						else
							avatar = $('<div class="player", id="'+entity.ID+'">
								<div class="chat"></div><div class="playername"></div><div class="playerscore">0</div></div>')
						window.entities[entity.ID].avatar = avatar
						avatar.css
							width: entity.w
							height: entity.h
							left: entity.x
							top: entity.y
							transform: 'rotate(' + String(entity.d * -1 ) + 'deg)'
						if entity.coin
							avatar.find('.playerscore').html entity.coin
						if entity.color
							avatar.css('background-color', entity.color)
						if entity.cs
							for c in entity.cs
								avatar.addClass c
						entity.to_update = []
						if entity.t is true
							$('#actors').append avatar
						else
							$('#dynamics').append avatar

					else

						for prop of entity
							if prop isnt 'ID'
								if prop not in window.entities[entity.ID].to_update
									window.entities[entity.ID].to_update.push prop
							window.entities[entity.ID][prop] = entity[prop]
			if $('.player.self').length > 0
				o = 
					top: parseInt($('.player.self').css('top'))
					left: parseInt($('.player.self').css('left'))

				relative = o.top + parseInt($('#game').css('top'))

				if relative > window.v_h*.6
					diff = window.v_h*.6 - relative
					$('#game').css('top', parseInt($('#game').css('top'))+diff+'px' )
				else if relative < window.v_h*.4
					diff = window.v_h*.4 - relative
					$('#game').css('top', parseInt($('#game').css('top'))+diff+'px' )

				relative = o.left + parseInt($('#game').css('left'))

				if relative > window.v_w*.6
					diff = window.v_w*.6 - relative
					$('#game').css('left', parseInt($('#game').css('left'))+diff+'px' )
				else if relative < window.v_w*.4
					diff = window.v_w*.4 - relative
					$('#game').css('left', parseInt($('#game').css('left'))+diff+'px' )

	window.update_entities()





	window.keys = []
	$(window).keydown (e)->
		if $('#chat').is(':focus')
			if e.keyCode is 13
			
				ws.send(JSON.stringify({'chat':$('#chat').val()}))
				$('#chat').val('')
				$('#chat').blur()
		else if e.keyCode not in window.keys
			window.keys.push e.keyCode
			ws.send(JSON.stringify({'keydown':e.keyCode}))
	$(window).keyup (e)->
		window.keys.remove e.keyCode
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
					if $(el).hasClass 'dynamic'
						b.dynamic = true
					if $(el).hasClass 'dynamic' or $(el).hasClass 'collect'
						cs = []
						for c in $(el).attr('class').split(' ')
							if c and c isnt 'dynamic'
								cs.push c
						if cs.length > 0
							b.cs = cs
					if $(el).hasClass 'collect'
						b.type = 'collect'
					if $(el).hasClass 'spawn'
						b.type = 'spawn'
					result.push b
					for child in $(el).children()
						recurse(child)
			for child in $(temp).children()
				recurse(child)
			console.log JSON.stringify(result)

$('#connect').click (e)->
	name = $('#username').val()
	color = $('.color_choice.active').first().css('background-color')
	connect_to_socket(name, color)
	$('.connectbox').html '<p><marquee direction="left">Trying to connect, but if you can read this the server is probably down..</marquee></p>'
	

$('.color_choice').click (e)->
	$('.color_choice').removeClass 'active'
	$(this).addClass 'active'

