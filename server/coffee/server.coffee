util = require("util")

Box2D = require './libs/Box2dWeb-2.1.a.3.js'
Sim = require './simulation.js'
fs = require 'fs'
winston = require 'winston'

winston.add(winston.transports.File, { filename: 'console.log' })
winston.handleExceptions(new winston.transports.File({ filename: 'stderr.log' }))
winston.exitOnError = true
winston.info 'start winston logs'







Array::remove = (item)->
  indx = @indexOf(item)
  if indx != -1
    return @.splice(indx,1)

randint = (max)-> 
	return parseInt(Math.random() * max)

IDcounter = 0
getID = ()->
	IDcounter += 1
	return IDcounter



game = Sim.game
Player = Sim.Player



WebSocketServer = require("ws").Server
wss = new WebSocketServer(port: 8079)
wss.on "connection", (ws) ->
	ws.on "message", (message) ->
		message = JSON.parse(message)
		if typeof message is 'object'
			if message.login?
				Sim.game.new_connection(ws, message.login)

			else if ws.player?
				if message.ping?
					ws.player.send('pong': new Date().getTime())
				if message.chat?
					if message.chat.slice(0,7) is "&admin:"
						Sim.game.admin message.chat.split("&admin:")[1]
					else
						d = new Date()
						stamp = d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()
						winston.info '['+stamp+'] '+ws.player.name+':', message.chat
						Sim.game.broadcast({'chat':message.chat, 'who':ws.player.ID})
				if message.keydown?
					ws.player.keydown(message.keydown)
				if message.keyup?
					ws.player.keyup(message.keyup)

		#console.log "received: %s", message

	ws.on "close", (message) ->
		Sim.game.players.remove ws.player
		Sim.game.world.DestroyBody ws.player.body
		ws.player.body = null
		Sim.game.broadcast {disconnect:ws.player.ID}
		winston.info '-CONNECT'


	ws.on 'error', (error)->
    	console.log('Client #%d error: %s', ws.player.ID, error.message)

	






