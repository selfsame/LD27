levels = [
	'[{"x":552,"y":358,"w":160,"h":86},{"x":-2,"y":-5,"w":16,"h":790},{"x":100,"y":667,"w":450,"h":40},{"x":786,"y":-22,"w":16,"h":818},{"x":5,"y":-1,"w":795,"h":33},{"x":4,"y":767,"w":795,"h":33},{"x":338,"y":290,"w":177,"h":41}]'
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


class Player
	constructor: (@connection)->
		@ID = root.getID()
		@x = (root.randint(700)) + 50 
		@y = 600
		@w = 10
		@h = 30
		@name = 'anon'
		@keys = []
		@contacts = []
		@on_ground = false
		@head_clear = true
		@max_force = 4
		@max_velocity = 4.0
		@speed = .7

	status: ()->
		return {x:@x, y:@y}
	state: ()->
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2

		return {ID:@ID, x:@x, y:@y, w:@w , h:@h }
	send: (obj)->
		@connection.send JSON.stringify(obj)
	keydown: (code)->
		@keys.push code
		if code is 32 
			if @on_ground
				@apply_velocity(0, 4.2)

	keyup: (code)->
		if code in @keys
			@keys.remove code


	apply_velocity: (x=0, y=0)->

		vel = @body.GetLinearVelocity()
		max = @max_velocity
		x = x+vel.x
		y = y+vel.y

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
				@on_ground = true

	contact_remove: (entity, point)->
		@on_ground = false




class Game
	constructor: ()->
		@scale = 100.0
		
		@level = 0
		@players = []
		worldAABB = new B.b2AABB()
		worldAABB.lowerBound.Set(-10.0, -10.0)
		worldAABB.upperBound.Set(10.0, 10.0)
		gravity = new B.b2Vec2(0.0, -5.0)
		@world = new B.b2World(worldAABB, gravity, true)
		@boxes = []
		@load_level 0
		console.log new B.b2ContactListener()
		@ContactListener = new B.b2ContactListener()


		@ContactListener.Add = @contact_begin
		@ContactListener.Persist = @contact_persist
		@ContactListener.Remove = @contact_remove
		@world.SetContactListener @ContactListener


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
				@boxes.push @make_static_box obj

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
		for p in @players
			set.push p.state()
		@broadcast {debrief:set}
		for p in @players
			p.update()

	new_connection: (ws)->
		new_player = new Player(ws)
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
		
		
		@broadcast({connect:new_player.state()})
		new_player.send({load:@level})

	broadcast: (message)->
		for p in @players
			p.send message

root.Player = Player

root.game = new Game()
root.game.update()