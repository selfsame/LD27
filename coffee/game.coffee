Array::remove = (item)->
	indx = @indexOf(item)
	if indx != -1
		return @.splice(indx,1)


window.v_w = 800
window.v_h = 600
$('#viewport').css
	width: window.v_w
	height: window.v_h

connect_to_socket = (_name, _color)->
	ws = new WebSocket('ws://'+window.location.hostname+':8079') 
	console.dir ws
	ws.onopen = ()->
		ws.send(JSON.stringify({'login':{name:_name, color:_color}}))
	ws.onmessage = (message)->
		data = JSON.parse(message.data)	

		if data.self?
			window.me = data.self
		if data.disconnect?
			if $('#'+data.disconnect)[0]?
				$('#'+data.disconnect).detach()
	
		else if data.chat?
			if $('#'+data.who)[0]?
				bubble = $('<p class="bubble" >'+data.chat+'</p>')
				$('#'+data.who).children('.chat').html bubble
				bubble.css('margin-top', -1*bubble.height() - 25)
				bubble.delay(2000).animate {opacity:0.0}, 300, ()->
					bubble.detach()
		else if data.load?
			console.log 'load'
			n = data.load

			$.get './levels/level'+n+'.html', (data)->
				$('#game').html data
				$('#game').find('.dynamic').detach()
		else if data.debrief? or data.connect?
			if not $('body').children('#debug')[0]?
				$('body').append('<div id="debug"></div>')

			set = data.debrief or data.connect
			#$('#debug').html '<p>'+JSON.stringify(set)+'</p>'
			for player in set

				if not $('#'+player.ID)[0]?
					console.log 'new ', player
					if player.t? and player.t is true
						avatar = $('<div class="player dynamic", id="'+player.ID+'">
							</div>')
					else
						avatar = $('<div class="player", id="'+player.ID+'">
							<div class="chat"></div><div class="playername"></div></div>')
					if player.ID is window.me
						avatar.addClass 'self'
					if player.cs
						for c in player.cs
							avatar.addClass c
					avatar.css 
						width: player.w
						height:player.h
						position:'absolute'
						left:player.x+10
						top:player.y+10

					if player.color
						avatar.css
							'background-color':player.color
					if player.name
						avatar.children('.playername').html player.name
					$('#game').append avatar
				else
					avatar = $('#'+player.ID)
					if player.ID is window.me
						avatar.addClass 'self'
					if player.cs
						for c in player.cs
							avatar.addClass c
					if player.color
						avatar.css
							'background-color':player.color
					if player.name
						avatar.children('.playername').html player.name
					if player.x
						avatar.css 
							left: player.x
					if player.y
						avatar.css 
							top: player.y
					if player.d?
						deg = player.d * -1
						avatar.css('transform', 'rotate('+deg+'deg)')
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
	$('.connectbox').css('display','none')
	$('#connected').css('display', 'block')

$('.color_choice').click (e)->
	$('.color_choice').removeClass 'active'
	$(this).addClass 'active'
