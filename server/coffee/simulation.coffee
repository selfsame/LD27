winston = require 'winston'

levels = ['[{"x":341,"y":996,"w":0,"h":0},{"x":-14,"y":187,"w":286,"h":1737},{"x":1044,"y":170,"w":318,"h":1753},{"x":-1,"y":-1,"w":1402,"h":225},{"x":402,"y":305,"w":472,"h":45},{"x":263,"y":397,"w":101,"h":50},{"x":426,"y":514,"w":156,"h":46},{"x":701,"y":401,"w":53,"h":63},{"x":1482,"y":502,"w":20,"h":20},{"x":266,"y":640,"w":99,"h":151},{"x":352,"y":734,"w":504,"h":57},{"x":619,"y":1299,"w":430,"h":41},{"x":933,"y":875,"w":121,"h":274},{"x":730,"y":1008,"w":50,"h":39},{"x":394,"y":1298,"w":40,"h":39},{"x":814,"y":607,"w":161,"h":56},{"x":576,"y":992,"w":346,"h":10,"dynamic":true,"cs":["purp"]},{"x":263,"y":898,"w":168,"h":41},{"x":257,"y":1732,"w":795,"h":192},{"x":439,"y":494,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_77"],"type":"collect"},{"x":404,"y":239,"w":468,"h":37,"type":"spawn"},{"x":454,"y":494,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":485,"y":494,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":728,"y":383,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":713,"y":383,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":815,"y":587,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":830,"y":587,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":1017,"y":252,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":277,"y":877,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":292,"y":877,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":323,"y":877,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":293,"y":836,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":324,"y":836,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":278,"y":836,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":285,"y":1282,"w":258,"h":8,"dynamic":true,"cs":["purp"]},{"x":529,"y":1477,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":585,"y":1474,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":643,"y":1475,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":712,"y":1472,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":789,"y":1425,"w":160,"h":299},{"x":980,"y":1484,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_45","break__fullsize_128","break__fullsize_211"],"type":"collect"},{"x":965,"y":1484,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_47","break__fullsize_130","break__fullsize_213"],"type":"collect"},{"x":1012,"y":1483,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_49","break__fullsize_132","break__fullsize_215"],"type":"collect"},{"x":1027,"y":1483,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_51","break__fullsize_134","break__fullsize_217"],"type":"collect"},{"x":978,"y":1527,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_53","break__fullsize_136","break__fullsize_219"],"type":"collect"},{"x":963,"y":1527,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_55","break__fullsize_138","break__fullsize_221"],"type":"collect"},{"x":1010,"y":1526,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_57","break__fullsize_140","break__fullsize_223"],"type":"collect"},{"x":1025,"y":1526,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_59","break__fullsize_142","break__fullsize_225"],"type":"collect"},{"x":1010,"y":1575,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_61","break__fullsize_144","break__fullsize_227"],"type":"collect"},{"x":978,"y":1576,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_63","break__fullsize_146","break__fullsize_229"],"type":"collect"},{"x":963,"y":1576,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_65","break__fullsize_148","break__fullsize_231"],"type":"collect"},{"x":1025,"y":1575,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_67","break__fullsize_150","break__fullsize_233"],"type":"collect"},{"x":1019,"y":1279,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_69","break__fullsize_152","break__fullsize_235"],"type":"collect"},{"x":1004,"y":1279,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_71","break__fullsize_154","break__fullsize_237"],"type":"collect"},{"x":313,"y":1657,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_73","break__fullsize_156","break__fullsize_239"],"type":"collect"},{"x":298,"y":1657,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_75","break__fullsize_158","break__fullsize_241"],"type":"collect"},{"x":294,"y":1250,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_77","break__fullsize_160","break__fullsize_243"],"type":"collect"},{"x":329,"y":1229,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_79","break__fullsize_162","break__fullsize_245"],"type":"collect"},{"x":862,"y":843,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_81","break__fullsize_164","break__fullsize_247"],"type":"collect"},{"x":827,"y":864,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_83","break__fullsize_166","break__fullsize_249"],"type":"collect"},{"x":268,"y":1434,"w":91,"h":39},{"x":423,"y":1512,"w":79,"h":39},{"x":394,"y":1655,"w":40,"h":39},{"x":731,"y":1126,"w":105,"h":39}] ',
'[{"x":274,"y":198,"w":63,"h":396},{"x":943,"y":195,"w":63,"h":396},{"x":777,"y":239,"w":34,"h":34,"dynamic":true,"cs":["light","volleyball","circle"]},{"x":274,"y":167,"w":731,"h":45},{"x":357,"y":486,"w":575,"h":47,"type":"spawn"},{"x":339,"y":545,"w":604,"h":30},{"x":646,"y":419,"w":8,"h":129}]',
'[{"x":153,"y":64,"w":761,"h":97},{"x":317,"y":178,"w":431,"h":39,"type":"spawn"},{"x":326,"y":499,"w":32,"h":32,"dynamic":true,"cs":["b1","circle","light","break__fullsize_6"]},{"x":150,"y":139,"w":136,"h":485},{"x":139,"y":618,"w":783,"h":131},{"x":791,"y":139,"w":141,"h":485},{"x":351,"y":326,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light"]},{"x":476,"y":337,"w":19,"h":19,"dynamic":true,"cs":["b3","circle","light","break__fullsize_12"]},{"x":728,"y":251,"w":32,"h":32,"dynamic":true,"cs":["b3","circle","light","break__fullsize_14"]},{"x":665,"y":388,"w":32,"h":32,"dynamic":true,"cs":["b1","circle","light"]},{"x":405,"y":446,"w":18,"h":18,"dynamic":true,"cs":["b2","circle","light"]},{"x":538,"y":322,"w":36,"h":36,"dynamic":true,"cs":["b1","circle","light","break__fullsize_18"]},{"x":327,"y":264,"w":32,"h":32,"dynamic":true,"cs":["b3","circle","light","break__fullsize_20"]},{"x":666,"y":295,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_22"]},{"x":317,"y":387,"w":22,"h":22,"dynamic":true,"cs":["b1","break__fullsize_24"]},{"x":575,"y":408,"w":19,"h":19,"dynamic":true,"cs":["b3","circle","light","break__fullsize_26"]},{"x":673,"y":458,"w":32,"h":32,"dynamic":true,"cs":["b1","circle","light","break__fullsize_28"]},{"x":612,"y":500,"w":32,"h":32,"dynamic":true,"cs":["b3","circle","light","break__fullsize_30"]},{"x":636,"y":562,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_32"]},{"x":761,"y":573,"w":19,"h":19,"dynamic":true,"cs":["b3","circle","light","break__fullsize_34"]},{"x":504,"y":427,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_36"]},{"x":470,"y":488,"w":51,"h":51,"dynamic":true,"cs":["b1","circle","light","break__fullsize_38"]},{"x":558,"y":547,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_40"]},{"x":445,"y":218,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":481,"y":147,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":378,"y":181,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":646,"y":189,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":355,"y":366,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":731,"y":273,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":378,"y":181,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":445,"y":218,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"}] ',
'[{"x":8,"y":595,"w":348,"h":33},{"x":361,"y":499,"w":131,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":904,"y":478,"w":100,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":526,"y":414,"w":333,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":1042,"y":632,"w":131,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":-3,"y":6,"w":32,"h":929},{"x":8,"y":907,"w":2552,"h":33},{"x":71,"y":454,"w":225,"h":112,"type":"spawn"},{"x":1478,"y":545,"w":382,"h":7,"dynamic":true,"cs":["purp"]},{"x":2549,"y":1,"w":32,"h":929},{"x":1340,"y":537,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":1648,"y":564,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":1970,"y":462,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":2269,"y":360,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":2251,"y":216,"w":348,"h":33},{"x":2098,"y":345,"w":382,"h":7,"dynamic":true,"cs":["purp"]},{"x":1802,"y":446,"w":382,"h":7,"dynamic":true,"cs":["purp"]},{"x":1247,"y":507,"w":196,"h":24,"dynamic":true,"cs":["purp"]}] ',
'[{"x":552,"y":358,"w":160,"h":86},{"x":-2,"y":-5,"w":16,"h":790},{"x":100,"y":667,"w":450,"h":40},{"x":786,"y":-22,"w":16,"h":818},{"x":5,"y":-1,"w":795,"h":33},{"x":4,"y":767,"w":795,"h":33},{"x":338,"y":290,"w":177,"h":41},{"x":205,"y":270,"w":218,"h":15,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":679,"y":316,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_15","purp"]},{"x":693,"y":276,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_17","purp"]},{"x":635,"y":320,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":646,"y":275,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_21","purp"]},{"x":669,"y":238,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_23","purp"]},{"x":362,"y":159,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_23","purp"]},{"x":340,"y":197,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_21","purp"]},{"x":383,"y":199,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_17","purp"]},{"x":383,"y":236,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_15","purp"]},{"x":335,"y":234,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":586,"y":592,"w":178,"h":152,"type":"spawn"},{"x":103,"y":562,"w":112,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":104,"y":576,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":194,"y":577,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":266,"y":562,"w":112,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":267,"y":576,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":357,"y":577,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":182,"y":457,"w":112,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":183,"y":471,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":273,"y":472,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":182,"y":348,"w":73,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":183,"y":366,"w":18,"h":91,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":237,"y":366,"w":18,"h":89,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":314,"y":513,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":339,"y":514,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":313,"y":537,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":338,"y":538,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":135,"y":642,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":160,"y":643,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":247,"y":743,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":210,"y":221,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":235,"y":222,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":209,"y":245,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":234,"y":246,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":667,"y":211,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":692,"y":212,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":201,"y":324,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":226,"y":325,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"}]',
'[{"x":41,"y":8,"w":1059,"h":54},{"x":529,"y":249,"w":105,"h":22},{"x":null,"y":null,"w":0,"h":0},{"x":405,"y":297,"w":367,"h":146,"type":"spawn"},{"x":1030,"y":13,"w":84,"h":1047},{"x":33,"y":28,"w":59,"h":1041},{"x":333,"y":528,"w":494,"h":16,"dynamic":true,"cs":["purp"]},{"x":575,"y":550,"w":26,"h":504},{"x":21,"y":1050,"w":1094,"h":72}] ' 
]


B = require './libs/Box2dWeb-2.1.a.3.js'

Array::remove = (item)->
	indx = @indexOf(item)
	if indx != -1
		return @.splice(indx,1)

Array::random = ->
  if @length is 0
    return undefined
  return @[Math.floor(Math.random()*@length)]

root = exports ? this

root.randint = (max)-> 
	return parseInt(Math.random() * max)

root.IDcounter = 0
root.getID = ()->
	root.IDcounter += 1
	return root.IDcounter

root.requestAnimFrame = ( ()->
	return (callback)->
		setTimeout(callback, 1000/50)
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
			result.x = parseInt(@x)
		if Math.abs(@y-@cache.y) >= 1.0
			@cache.y = @y
			result.y = parseInt(@y)
		if Math.abs(@degrees-@cache.d) >= .4
			@cache.d = @degrees
			result.d = parseInt(@degrees)
		return result
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
		if jj > 0
			delta.ID = @ID
			return delta
		return false

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
		@max_velocity = 6.0
		@max_jump = 5.5
		@speed = .2
		@cache = {x:-9999, y:-9999, d:0}
		@coins = 0
		@type = 'player'
	set_position: (x,y)->
		@body.SetXForm(new B.b2Vec2((x + @w / 2) / root.game.scale , -1 * (y + @h / 2) /  root.game.scale ), @body.GetAngle() )
	spawn: ()->
		sp = root.game.spawn
		@x = (root.randint(sp.w)) + sp.x 
		@y = (root.randint(sp.h)) + sp.y
		@set_position(@x, @y)
		
	delta_state: ()->
		@degrees = @body.GetAngle() * (180/Math.PI)
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2
		delta = @get_delta()
		jj = 0
		for key of delta
			jj += 1
		if jj > 0
			delta.ID = @ID
			return delta
		return false


	state: ()->
		@degrees = @body.GetAngle() * (180/Math.PI)
		pos = @body.GetPosition()
		@x = (pos.x  ) * root.game.scale - @w / 2
		@y = -(pos.y  ) * root.game.scale - @h / 2
		return {t:@dynamic, ID:@ID, x:@x, y:@y, w:@w , h:@h, name:@name, color:@color, d:@degrees, coin:@coins }
	

	send: (obj)->
		try
			@connection.send JSON.stringify(obj)
		catch error
			winston.warn 'failure to send player socket, removing player'
			root.game.close_player(@)

	keydown: (code)->

		@keys.push code
		if code is 32 
			if @on_ground
				@apply_velocity(0, @max_jump*.9, true)

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
			if vel.y > y
				y = vel.y 
		try
			v = new B.b2Vec2(x,y)
			@body.SetLinearVelocity( v )
		catch error
			winston.error 'player.body.SetLinearVelocity failed'

	apply_force: (x, y)->
		vel = @body.GetLinearVelocity()
		x = x * @max_force
		y = y * @max_force
		v = new B.Common.Math.b2Vec2(x,y)
		p = @body.GetWorldCenter()
		@body.ApplyForce( v, p )

	update: ()->
		vel = @body.GetLinearVelocity()
		v = new B.b2Vec2(vel.x*.95,vel.y)
		@body.SetLinearVelocity( v )
		@on_ground -= .05
		if @on_ground > 0
			@on_ground -= .1
		else
			@on_ground = 0
		@body.m_sweep.a = -.05
		
		if 37 in @keys
			if @on_ground
				@apply_velocity(-@speed, 0.0)
			else
				@apply_velocity(-.1, 0.0)
		if 39 in @keys
			if @on_ground
				@apply_velocity(@speed, 0.0)
			else
				@apply_velocity(.1, 0.0)


	contact_add: (entity, point)->
	contact_begin: (entity, point)->
		if entity.type? and entity.type is 'collect'
			@coins += 1
			root.game.dynamics_to_destroy.push entity
			root.game.broadcast({'collect':@ID})
		

	contact_persist: (entity, point)->
		if point.normal?
			if point.normal.y  < -.5 or point.normal.y > .5
				@on_ground = 1.0
			#if point.normal.x  < -.5 or point.normal.x > .5
			#	@on_ground = 1.0


		
			



	contact_remove: (entity, point)->



























class Game
	constructor: ()->
		@reboot_hook = ()-> return false
		@scale = 100.0
		@mode = 'lobby'
		@level = 0
		@timer = 11
		@players = []
		@dynamics = []
		@spawn = {x:50, y:500, w:700, h:100}
		@dynamics_to_destroy = []
		worldAABB = new B.b2AABB()
		worldAABB.lowerBound.Set(-120.0, -120.0)
		worldAABB.upperBound.Set(120.0, 120.0)
		gravity = new B.b2Vec2(0.0, -10.0)
		@world = new B.b2World(worldAABB, gravity, true)
		@boxes = []
		
		@ContactListener = new B.b2ContactListener()


		@ContactListener.Add = @contact_begin
		@ContactListener.Persist = @contact_persist
		@ContactListener.Remove = @contact_remove
		@world.SetContactListener @ContactListener
		@mode_time = @time()
		winston.info "Simulation started.."

	time: ()->
		d = new Date()
		return d.getTime()

	contact_add: (point)->
		#console.log 'world contact add'
		ab = root.game.get_contact_entities point
		if ab[0] and ab[0].contact_add?
			ab[0].contact_add ab[1], point
		if ab[1] and ab[1].contact_add?
			ab[1].contact_add ab[0], point
	contact_begin: (point)->
		#console.log 'world contact begin'
		ab = root.game.get_contact_entities point
		if ab[0] and ab[0].contact_begin?
			ab[0].contact_begin ab[1], point
		if ab[1]  and ab[1].contact_begin?
			ab[1].contact_begin ab[0], point
	contact_persist: (point)->
		#console.log 'world contact persist'
		ab = root.game.get_contact_entities point
		if ab[0] and ab[0].contact_persist?
			ab[0].contact_persist ab[0], point
		if ab[1] and ab[1].contact_persist?
			ab[1].contact_persist ab[1], point
	contact_remove: (point)->
		#console.log 'world contact remove'
		ab = root.game.get_contact_entities point
		if ab[0] and ab[0].contact_remove?
			ab[0].contact_remove ab[0], point
		if ab[1] and ab[1].contact_remove?
			ab[1].contact_remove ab[1], point

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

		
		for d in @boxes
			@world.DestroyBody d
		
		@dynamics = []
		@boxes = []

		data = JSON.parse(levels[@level])
		for obj in data
			
			

			if obj.dynamic?

				@boxes.push @make_dynamic_box obj
			else if obj.type?
				if obj.type is 'spawn'
					@spawn = obj


			else
				@boxes.push @make_static_box obj

		for p in @players
			p.spawn()

		@broadcast({load:@level})


		ppp = @players.map (p)->p.state()
		ddd = @dynamics.map (p)->p.state()
		@broadcast {debrief:ddd.concat(ppp)}

	close_player: (player)->
		@players.remove player
		@world.DestroyBody player.body
		@broadcast {disconnect:player.ID}

	remove_dynamic: (dynamic)->
		@dynamics.remove dynamic
		@broadcast {'remove':dynamic.ID}
		
		if dynamic.body in @boxes
			@boxes.remove dynamic.body
		@world.DestroyBody dynamic.body



	make_dynamic_box: (obj)->
		new_dynamic = new Dynamic()
		if obj.w is 0
			obj.w = 16
		if obj.h is 0
			obj.h = 16
		new_dynamic.w = obj.w
		new_dynamic.h = obj.h
		new_dynamic.cs = obj.cs
		@dynamics.push new_dynamic
		bodyDef = new B.b2BodyDef()
		
			
		bodyDef.allowSleep = false
		bodyDef.type = B.b2Body.b2_dynamicBody

		bodyDef.position.Set((obj.x + obj.w / 2) / @scale , -1 * (obj.y + obj.h / 2) /  @scale )
		body = @world.CreateBody(bodyDef)

		if obj.cs? and 'circle' in obj.cs
			shapeDef = new B.b2CircleDef()
			shapeDef.radius = (obj.w / 2) / @scale
		else
			shapeDef = new B.b2PolygonDef()
			shapeDef.SetAsBox obj.w / 2 / @scale, obj.h / 2 / @scale

		shapeDef.density = 1.0
		shapeDef.friction = 0.2
		shapeDef.restitution = .2
		
		if obj.cs? and 'light' in obj.cs
			shapeDef.density = 0.16
			shapeDef.restitution = .95
		body.CreateShape shapeDef
		body.SetMassFromShapes()
		
		if obj.type? and obj.type is 'collect'
			new_dynamic.type = obj.type
			body.SetUserData(new_dynamic)
		new_dynamic.body = body
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
	admin: (code)->
		code = code.split(':')
		command = code[0]
		if command is "level"
			@level = parseInt(command[1])
			@load_level(parseInt(command[1]))
		if command is "reboot"
			@reboot()
	update: ()->
		if root.game.players.length is 0
			root.requestAnimFrame root.game.update
			return
		diff = root.game.time() - root.game.mode_time
		if root.game.mode is 'game'
			limit = 20000
		else
			limit = 6000
		if root.game.timer isnt parseInt(diff/(limit/10))
			root.game.timer = parseInt(diff/(limit/10))
			root.game.broadcast({'time':parseInt(diff/(limit/10))})
		if diff > limit
			root.game.mode_time = root.game.time()
			
			if root.game.mode is 'lobby'
				root.game.mode = 'game'
				root.game.level = parseInt(Math.random()*(levels.length))
				root.game.load_level(root.game.level)
			else
				root.game.mode = 'lobby'
				

				for p in root.game.players
					p.set_position(Math.random()*700 + 50, 350 + Math.random()*30)
				root.game.update_players()
				root.game.broadcast({'lobby':true})

		if root.game.mode is 'game'
			try
				root.game.world.Step(1.0/60.0, 5)
			catch error
				winston.error "box2d step failed"

				@reboot()
				return
			root.game.update_players()
		root.requestAnimFrame root.game.update

	reboot: ()->
		winston.warn "rebooting game"
		for player in @players
			@close_player player
		root.game = new Game()
		root.game.update()

	update_players:()->
		for d in @dynamics_to_destroy
			@remove_dynamic(d)
		@dynamics_to_destroy = []
		set = []
		dset = []
		for p in @players
			delta = p.delta_state()
			if delta
				set.push delta
		for d in @dynamics
			delta = d.delta_state()
			if delta
				set.push delta

		@broadcast {debrief:set}

		for p in @players
			p.update()

	new_connection: (ws, login)->
		winston.info '+CONNECT  TOTAL('+@players.length+')'
		new_player = new Player(ws)
		if login.name.length > 24
			login.name = login.name.slice(0,23)
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
		shapeDef.density = 1.3
		shapeDef.friction = 2.0
		shapeDef.restitution = .2
		body.CreateShape shapeDef

		shapeDef = new B.b2CircleDef()
		shapeDef.radius = (new_player.w * 2 / 2) / @scale
		#console.log shapeDef
		shapeDef.localPosition.y = -.1
		body.CreateShape shapeDef

		body.SetMassFromShapes()
		
		new_player.body = body
		body.SetUserData(new_player)
		
		if @mode is 'lobby'
			new_player.set_position(Math.random()*700 + 50, 350 + Math.random()*100)
			new_player.send({'lobby':true})
		else
			new_player.send({load:@level})
		@broadcast({connect:[new_player.state()]})
		
		new_player.send({self:new_player.ID})

		ppp = @players.map (p)->p.state()
		ddd = @dynamics.map (p)->p.state()
		new_player.send {debrief:ppp.concat( ddd)}



	broadcast: (message)->
		clean = false
		for p in @players
			if p is undefined
				clean = true
			if p?.send?
				p.send message
		if clean
			@players.remove undefined

root.Player = Player

root.game = new Game()
root.game.load_level(root.game.level)
root.game.update()


