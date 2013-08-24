

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



class Player
	constructor: ()->
		@ID = getID()
		@x = randint(500)
		@y = randint(500)
		@name = 'anon'
	status: ()->
		return {x:@x, y:@y}
	state: ()->
		return {ID:@ID, x:@x, y:@y}


class Game
	constructor: ()->
		@players = []
	broadcast: (message)->
		for p in @players
			p.connection.send message


game = new Game()

WebSocketServer = require("ws").Server
wss = new WebSocketServer(port: 8080)
wss.on "connection", (ws) ->
	ws.player = new Player()
	ws.player.connection = ws
	game.players.push ws.player
	game.broadcast(JSON.stringify({connect:ws.player.state()}))
	ws.on "message", (message) ->
		message = JSON.parse(message)
		if typeof message is 'object'
			if message.name?
				ws.player.name = message.name
			if message.chat?
				console.log 'chat', message.chat
				game.broadcast(JSON.stringify({'chat':message.chat, 'who':ws.player.ID}))
				ws.player.name = message.name
		console.log "received: %s", message

	ws.on "close", (message) ->
		game.players.remove ws.player
		for p in game.players
			p.connection.send(JSON.stringify({disconnect:ws.player.ID}))

	ws.send JSON.stringify({debrief:game.players.map (p)->p.state()})


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