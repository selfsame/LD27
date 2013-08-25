levels = [
	'[{"x":552,"y":358,"w":160,"h":86},{"x":-2,"y":-5,"w":16,"h":790},{"x":100,"y":667,"w":450,"h":40},{"x":786,"y":-22,"w":16,"h":818},{"x":5,"y":-1,"w":795,"h":33},{"x":4,"y":767,"w":795,"h":33},{"x":237,"y":87,"w":318,"h":46},{"x":175,"y":633,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":9,"y":435,"w":143,"h":42},{"x":178,"y":321,"w":126,"h":37},{"x":648,"y":501,"w":143,"h":42},{"x":437,"y":332,"w":281,"h":21,"dynamic":true,"cs":["purp"]},{"x":215,"y":631,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":196,"y":596,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":238,"y":597,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":256,"y":630,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":406,"y":633,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":185,"y":285,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":185,"y":252,"w":34,"h":30,"dynamic":true,"cs":["purp"]},{"x":432,"y":188,"w":145,"h":46}] ',
	'[]',
	'[]',
	'[{"x":341,"y":996,"w":0,"h":0},{"x":-14,"y":187,"w":286,"h":1737},{"x":1044,"y":170,"w":318,"h":1753},{"x":-1,"y":-1,"w":1402,"h":225},{"x":402,"y":305,"w":472,"h":45},{"x":263,"y":397,"w":101,"h":50},{"x":426,"y":514,"w":156,"h":46},{"x":701,"y":401,"w":53,"h":63},{"x":1482,"y":502,"w":20,"h":20},{"x":266,"y":640,"w":99,"h":151},{"x":352,"y":734,"w":504,"h":57},{"x":619,"y":1299,"w":430,"h":41},{"x":933,"y":875,"w":121,"h":274},{"x":755,"y":1008,"w":20,"h":39},{"x":394,"y":1298,"w":40,"h":39},{"x":814,"y":607,"w":161,"h":56},{"x":576,"y":992,"w":346,"h":10,"dynamic":true,"cs":["purp"]},{"x":263,"y":898,"w":168,"h":41},{"x":257,"y":1732,"w":795,"h":192},{"x":439,"y":494,"w":0,"h":0,"type":"collect"},{"x":404,"y":239,"w":468,"h":37,"type":"spawn"},{"x":454,"y":494,"w":0,"h":0,"type":"collect"},{"x":485,"y":494,"w":0,"h":0,"type":"collect"},{"x":728,"y":383,"w":0,"h":0,"type":"collect"},{"x":713,"y":383,"w":0,"h":0,"type":"collect"},{"x":815,"y":587,"w":0,"h":0,"type":"collect"},{"x":830,"y":587,"w":0,"h":0,"type":"collect"},{"x":1017,"y":252,"w":0,"h":0,"type":"collect"},{"x":277,"y":877,"w":0,"h":0,"type":"collect"},{"x":292,"y":877,"w":0,"h":0,"type":"collect"},{"x":323,"y":877,"w":0,"h":0,"type":"collect"},{"x":293,"y":836,"w":0,"h":0,"type":"collect"},{"x":324,"y":836,"w":0,"h":0,"type":"collect"},{"x":278,"y":836,"w":0,"h":0,"type":"collect"},{"x":285,"y":1282,"w":258,"h":8,"dynamic":true,"cs":["purp"]},{"x":529,"y":1477,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":585,"y":1474,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":643,"y":1475,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":712,"y":1472,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":789,"y":1425,"w":160,"h":299},{"x":980,"y":1484,"w":0,"h":0,"type":"collect"},{"x":965,"y":1484,"w":0,"h":0,"type":"collect"},{"x":1012,"y":1483,"w":0,"h":0,"type":"collect"},{"x":1027,"y":1483,"w":0,"h":0,"type":"collect"},{"x":978,"y":1527,"w":0,"h":0,"type":"collect"},{"x":963,"y":1527,"w":0,"h":0,"type":"collect"},{"x":1010,"y":1526,"w":0,"h":0,"type":"collect"},{"x":1025,"y":1526,"w":0,"h":0,"type":"collect"},{"x":1010,"y":1575,"w":0,"h":0,"type":"collect"},{"x":978,"y":1576,"w":0,"h":0,"type":"collect"},{"x":963,"y":1576,"w":0,"h":0,"type":"collect"},{"x":1025,"y":1575,"w":0,"h":0,"type":"collect"},{"x":1019,"y":1279,"w":0,"h":0,"type":"collect"},{"x":1004,"y":1279,"w":0,"h":0,"type":"collect"},{"x":313,"y":1657,"w":0,"h":0,"type":"collect"},{"x":298,"y":1657,"w":0,"h":0,"type":"collect"},{"x":294,"y":1250,"w":0,"h":0,"type":"collect"},{"x":329,"y":1229,"w":0,"h":0,"type":"collect"},{"x":862,"y":843,"w":0,"h":0,"type":"collect"},{"x":827,"y":864,"w":0,"h":0,"type":"collect"},{"x":319,"y":1434,"w":40,"h":39},{"x":425,"y":1500,"w":40,"h":39},{"x":394,"y":1655,"w":40,"h":39}] ',
	'[]'
]


B = require './libs/Box2dWeb-2.1.a.3.js'

Array::remove = (item)->
	indx = @indexOf(item)
	if indx != -1
		return @.splice(indx,1)



root = exports ? this

root.randint = (max)-> 
	return parseInt(Math.random() * max)

root.IDcounter = 0
root.getID = ()->
	root.IDcounter += 1
	return root.IDcounter

root.requestAnimFrame = ( ()->
	return (callback)->
		setTimeout(callback, 1000/60)
)()

class Dynamic
	constructor: ()->
		@ID = root.getID()
		@x = (root.randint(700)) + 50 
		@y = 600
		@w = 10
		@h = 30
		@dynamic = true
		@cache = {x:-9999, y:-9999, d:0}
	get_delta: ()->
		result = {}
		if Math.abs(@x-@cache.x) >= 1.0
			@cache.x = @x
			result.x = @x
		if Math.abs(@y-@cache.y) >= 1.0
			@cache.y = @y
			result.y = @y
		if Math.abs(@d-@cache.d) >= 1.0
			@cache.d = @d
			result.d = @d
	state: ()->
		@degrees = @body.GetAngle() * (180/Math.PI)
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2
		return {t:@dynamic, ID:@ID, x:@x, y:@y, w:@w , h:@h, cs:@cs, d:@degrees }
	delta_state: ()->
		@degrees = @body.GetAngle() * (180/Math.PI)
		#if Math.abs(@_cached_degrees - degrees) >= 1 or needs_pos_redraw
		#	@_cached_degrees = degrees
			
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2
		delta = @get_delta()
		jj = 0
		for key of delta
			jj += 1
		return { ID:@ID, t:@dynamic, x:@x, y:@y, w:@w , h:@h, cs:@cs, d:@degrees }

class Player extends Dynamic
	constructor: (@connection)->
		@ID = root.getID()
		spawn = root.game.spawn
		@x = (root.randint(spawn.w)) + spawn.x 
		@y = (root.randint(spawn.h)) + spawn.y
		@w = 10
		@h = 30
		@dynamic = false
		@name = 'anon'
		@keys = []
		@contacts = []
		@on_ground = 0
		@head_clear = true
		@max_force = 4
		@max_velocity = 3.0
		@max_jump = 5.5
		@speed = .7
	delta_state: ()->
		@degrees = @body.GetAngle() * (180/Math.PI)
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2
		return { ID:@ID, t:@dynamic, x:@x, y:@y, w:@w , h:@h, name:@name, color:@color,d:@degrees}

	state: ()->
		@degrees = @body.GetAngle() * (180/Math.PI)
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2
		return {t:@dynamic, ID:@ID, x:@x, y:@y, w:@w , h:@h, name:@name, color:@color, d:@degrees }
	

	send: (obj)->
		try
			@connection.send JSON.stringify(obj)
		catch error
			console.log 'ERROR, failure to send player socket'

	keydown: (code)->
		@keys.push code
		if code is 32 
			if @on_ground
				@apply_velocity(0, @max_jump, true)

	keyup: (code)->
		if code in @keys
			@keys.remove code


	apply_velocity: (x=0, y=0, override=false)->

		vel = @body.GetLinearVelocity()
		max = @max_velocity
		x = x+vel.x
		y = y+vel.y
		if not override
			if Math.abs(x) > max
				x *= (max / Math.abs(x))
			if Math.abs(y) > max
				y *= (max / Math.abs(y))
		try
			v = new B.b2Vec2(x,y)
			@body.SetLinearVelocity( v )
		catch error
			console.log 'ERROR: ', B

	apply_force: (x, y)->
		vel = @body.GetLinearVelocity()
		x = x * @max_force
		y = y * @max_force
		v = new B.Common.Math.b2Vec2(x,y)
		p = @body.GetWorldCenter()
		@body.ApplyForce( v, p )

	update: ()->
		@on_ground -= .1
		if @on_ground > 0
			@on_ground -= .1
		else
			@on_ground = 0
		@body.m_sweep.a = 0
		
		if 37 in @keys
			if @on_ground
				@apply_velocity(-@speed, 0.0)
			else
				@apply_velocity(-.3, 0.0)
		if 39 in @keys
			if @on_ground
				@apply_velocity(@speed, 0.0)
			else
				@apply_velocity(.3, 0.0)


	contact_add: (entity, point)->
	contact_begin: (entity, point)->
		

	contact_persist: (entity, point)->
		#console.log 'contact:', point.normal
		if point.normal?
			if point.normal.y  > .5
				@on_ground = 1.0

	contact_remove: (entity, point)->





class Game
	constructor: ()->
		@scale = 100.0
		@mode = 'lobby'
		@level = 3
		@players = []
		@dynamics = []
		@spawn = {x:50, y:500, w:700, h:100}
		worldAABB = new B.b2AABB()
		worldAABB.lowerBound.Set(-60.0, -60.0)
		worldAABB.upperBound.Set(60.0, 60.0)
		gravity = new B.b2Vec2(0.0, -10.0)
		@world = new B.b2World(worldAABB, gravity, true)
		@boxes = []
		@load_level @level
		console.log new B.b2ContactListener()
		@ContactListener = new B.b2ContactListener()


		@ContactListener.Add = @contact_begin
		@ContactListener.Persist = @contact_persist
		@ContactListener.Remove = @contact_remove
		@world.SetContactListener @ContactListener
		@mode_time = @time()

	time: ()->
		d = new Date()
		return d.getTime()

	contact_add: (point)->
		#console.log 'world contact add'
		ab = root.game.get_contact_entities point
		if ab[0]
			ab[0].contact_add ab[1], point
		if ab[1]
			ab[1].contact_add ab[0], point
	contact_begin: (point)->
		#console.log 'world contact begin'
		ab = root.game.get_contact_entities point
		if ab[0]
			ab[0].contact_begin ab[1], point
		if ab[1]
			ab[1].contact_begin ab[0], point
	contact_persist: (point)->
		#console.log 'world contact persist'
		ab = root.game.get_contact_entities point
		if ab[0]
			ab[0].contact_persist ab[1], point
		if ab[1]
			ab[1].contact_persist ab[0], point
	contact_remove: (point)->
		#console.log 'world contact remove'
		ab = root.game.get_contact_entities point
		if ab[0]
			ab[0].contact_remove ab[1], point
		if ab[1]
			ab[1].contact_remove ab[0], point

	get_contact_entities: (point)->

		first = point.shape1.m_body #.GetUserData()
		next = point.shape2.m_body #.GetUserData()
		result = [false, false]
		if first.GetUserData()
			result[0] = first.GetUserData()
		if next.GetUserData()
			result[1] = next.GetUserData()
		return result		
	

	load_level: (n)->
		@debug = []
		if n < levels.length
			data = JSON.parse(levels[n])
			for obj in data
				if obj.type?
					if obj.type is 'spawn'
						@spawn = obj
				else if obj.dynamic?
					@boxes.push @make_dynamic_box obj
				else
					@boxes.push @make_static_box obj

	make_dynamic_box: (obj)->
		new_dynamic = new Dynamic()
		new_dynamic.w = obj.w
		new_dynamic.h = obj.h
		new_dynamic.cs = obj.cs
		@dynamics.push new_dynamic
		bodyDef = new B.b2BodyDef()
		bodyDef.allowSleep = false
		bodyDef.type = B.b2Body.b2_dynamicBody

		bodyDef.position.Set((obj.x + obj.w / 2) / @scale , -1 * (obj.y + obj.h / 2) /  @scale )
		body = @world.CreateBody(bodyDef)
		shapeDef = new B.b2PolygonDef()
		shapeDef.SetAsBox obj.w / 2 / @scale, obj.h / 2 / @scale

		shapeDef.density = 1.0
		shapeDef.friction = 0.3
		shapeDef.restitution = .2
		body.CreateShape shapeDef
		body.SetMassFromShapes()
		new_dynamic.body = body
		console.log body.GetAngle()
		return body

	make_static_box: (obj)->
		groundBodyDef = new B.b2BodyDef()
		groundBodyDef.position.Set ((obj.x + obj.w / 2) / @scale) , ((-1 * (obj.y + obj.h / 2)) / @scale) 
		groundBody = @world.CreateBody(groundBodyDef)
		groundShapeDef = new B.b2PolygonDef()
		groundShapeDef.friction = 0.3
		groundShapeDef.restitution = .2
		groundShapeDef.SetAsBox (obj.w / 2) / @scale, (obj.h / 2) / @scale
		groundBody.CreateShape groundShapeDef
		return groundBody

	update: ()->

		root.game.world.Step(1.0/60.0, 5)
		root.game.update_players()
		root.requestAnimFrame root.game.update
	update_players:()->
		set = []
		dset = []
		for p in @players
			set.push p.delta_state()
		for d in @dynamics
			set.push d.delta_state()
		@broadcast {debrief:set}

		for p in @players
			p.update()

	new_connection: (ws, login)->
		new_player = new Player(ws)
		new_player.name = login.name
		new_player.color = login.color
		ws.player = new_player
		@players.push new_player

		bodyDef = new B.b2BodyDef()
		bodyDef.allowSleep = false
		bodyDef.type = B.b2Body.b2_dynamicBody
		bodyDef.position.Set((new_player.x + new_player.w / 2) / @scale , -1 * (new_player.y + new_player.h / 2) /  @scale )
		body = @world.CreateBody(bodyDef)
		shapeDef = new B.b2PolygonDef()
		shapeDef.SetAsBox new_player.w / 2 / @scale, new_player.h / 2 / @scale
		shapeDef.density = 1.0
		shapeDef.friction = 0.3
		shapeDef.restitution = .2
		body.CreateShape shapeDef
		body.SetMassFromShapes()
		
		new_player.body = body
		body.SetUserData(new_player)
		
		
		@broadcast({connect:[new_player.state()]})
		new_player.send({load:@level})
		new_player.send({self:new_player.ID})
		ppp = @players.map (p)->p.state()
		ddd = @dynamics.map (p)->p.state()
		new_player.send {debrief:ppp.concat( ddd)}

	broadcast: (message)->
		for p in @players
			p.send message

root.Player = Player

root.game = new Game()
root.game.update()