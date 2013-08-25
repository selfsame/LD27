Box2D = require './libs/Box2dWeb-2.1.a.3.js'
Sim = require './simulation.js'

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
console.log Player

WebSocketServer = require("ws").Server
wss = new WebSocketServer(port: 8079)
wss.on "connection", (ws) ->
	
	ws.on "message", (message) ->
		message = JSON.parse(message)
		if typeof message is 'object'
			if message.login?
				game.new_connection(ws, message.login)

			else if ws.player?
				if message.chat?
					console.log 'chat', message.chat
					game.broadcast({'chat':message.chat, 'who':ws.player.ID})
				if message.keydown?
					ws.player.keydown(message.keydown)
				if message.keyup?
					ws.player.keyup(message.keyup)

		#console.log "received: %s", message

	ws.on "close", (message) ->
		game.players.remove ws.player
		game.world.DestroyBody ws.player.body
		ws.player.body = null
		game.broadcast {disconnect:ws.player.ID}


	ws.on 'error', (error)->
    	console.log('Client #%d error: %s', ws.player.ID, error.message)

	


#static server
static_ = require("node-static")
http = require("http")
util = require("util")
webroot = "../../"
port = 8075
file = new (static_.Server)(webroot,
  cache: 600
  headers:
    "X-Powered-By": "node-static"
)
http.createServer((req, res) ->
  req.addListener "end", ->
    file.serve req, res, (err, result) ->
      if err
        console.error "Error serving %s - %s", req.url, err.message
        if err.status is 404 or err.status is 500
          file.serveFile util.format("/%d.html", err.status), err.status, {}, req, res
        else
          res.writeHead err.status, err.headers
          res.end()
      else
        console.log "%s - %s", req.url, res.message


).listen port
console.log "node-static running at http://localhost:%d", port


