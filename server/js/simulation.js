// Generated by CoffeeScript 1.3.1
(function() {
  var B, Dynamic, Game, Player, levels, root,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; },
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  levels = ['[{"x":341,"y":996,"w":0,"h":0},{"x":-14,"y":187,"w":286,"h":1737},{"x":1044,"y":170,"w":318,"h":1753},{"x":-1,"y":-1,"w":1402,"h":225},{"x":402,"y":305,"w":472,"h":45},{"x":263,"y":397,"w":101,"h":50},{"x":426,"y":514,"w":156,"h":46},{"x":701,"y":401,"w":53,"h":63},{"x":1482,"y":502,"w":20,"h":20},{"x":266,"y":640,"w":99,"h":151},{"x":352,"y":734,"w":504,"h":57},{"x":619,"y":1299,"w":430,"h":41},{"x":933,"y":875,"w":121,"h":274},{"x":730,"y":1008,"w":50,"h":39},{"x":394,"y":1298,"w":40,"h":39},{"x":814,"y":607,"w":161,"h":56},{"x":576,"y":992,"w":346,"h":10,"dynamic":true,"cs":["purp"]},{"x":263,"y":898,"w":168,"h":41},{"x":257,"y":1732,"w":795,"h":192},{"x":439,"y":494,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_77"],"type":"collect"},{"x":404,"y":239,"w":468,"h":37,"type":"spawn"},{"x":454,"y":494,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":485,"y":494,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":728,"y":383,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":713,"y":383,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":815,"y":587,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":830,"y":587,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":1017,"y":252,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":277,"y":877,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":292,"y":877,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":323,"y":877,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":293,"y":836,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":324,"y":836,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":278,"y":836,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38"],"type":"collect"},{"x":285,"y":1282,"w":258,"h":8,"dynamic":true,"cs":["purp"]},{"x":529,"y":1477,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":585,"y":1474,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":643,"y":1475,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":712,"y":1472,"w":10,"h":251,"dynamic":true,"cs":["purp"]},{"x":789,"y":1425,"w":160,"h":299},{"x":980,"y":1484,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_45","break__fullsize_128","break__fullsize_211"],"type":"collect"},{"x":965,"y":1484,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_47","break__fullsize_130","break__fullsize_213"],"type":"collect"},{"x":1012,"y":1483,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_49","break__fullsize_132","break__fullsize_215"],"type":"collect"},{"x":1027,"y":1483,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_51","break__fullsize_134","break__fullsize_217"],"type":"collect"},{"x":978,"y":1527,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_53","break__fullsize_136","break__fullsize_219"],"type":"collect"},{"x":963,"y":1527,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_55","break__fullsize_138","break__fullsize_221"],"type":"collect"},{"x":1010,"y":1526,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_57","break__fullsize_140","break__fullsize_223"],"type":"collect"},{"x":1025,"y":1526,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_59","break__fullsize_142","break__fullsize_225"],"type":"collect"},{"x":1010,"y":1575,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_61","break__fullsize_144","break__fullsize_227"],"type":"collect"},{"x":978,"y":1576,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_63","break__fullsize_146","break__fullsize_229"],"type":"collect"},{"x":963,"y":1576,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_65","break__fullsize_148","break__fullsize_231"],"type":"collect"},{"x":1025,"y":1575,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_67","break__fullsize_150","break__fullsize_233"],"type":"collect"},{"x":1019,"y":1279,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_69","break__fullsize_152","break__fullsize_235"],"type":"collect"},{"x":1004,"y":1279,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_71","break__fullsize_154","break__fullsize_237"],"type":"collect"},{"x":313,"y":1657,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_73","break__fullsize_156","break__fullsize_239"],"type":"collect"},{"x":298,"y":1657,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_75","break__fullsize_158","break__fullsize_241"],"type":"collect"},{"x":294,"y":1250,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_77","break__fullsize_160","break__fullsize_243"],"type":"collect"},{"x":329,"y":1229,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_79","break__fullsize_162","break__fullsize_245"],"type":"collect"},{"x":862,"y":843,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_81","break__fullsize_164","break__fullsize_247"],"type":"collect"},{"x":827,"y":864,"w":0,"h":0,"dynamic":true,"cs":["collect","coin","break__fullsize_38","break__fullsize_83","break__fullsize_166","break__fullsize_249"],"type":"collect"},{"x":268,"y":1434,"w":91,"h":39},{"x":423,"y":1512,"w":79,"h":39},{"x":394,"y":1655,"w":40,"h":39},{"x":731,"y":1126,"w":105,"h":39}] ', '[{"x":274,"y":198,"w":63,"h":396},{"x":943,"y":195,"w":63,"h":396},{"x":777,"y":239,"w":34,"h":34,"dynamic":true,"cs":["light","volleyball","circle"]},{"x":274,"y":167,"w":731,"h":45},{"x":357,"y":486,"w":575,"h":47,"type":"spawn"},{"x":339,"y":545,"w":604,"h":30},{"x":646,"y":419,"w":8,"h":129}]', '[{"x":153,"y":64,"w":761,"h":97},{"x":317,"y":178,"w":431,"h":39,"type":"spawn"},{"x":326,"y":499,"w":32,"h":32,"dynamic":true,"cs":["b1","circle","light","break__fullsize_6"]},{"x":150,"y":139,"w":136,"h":485},{"x":139,"y":618,"w":783,"h":131},{"x":791,"y":139,"w":141,"h":485},{"x":351,"y":326,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light"]},{"x":476,"y":337,"w":19,"h":19,"dynamic":true,"cs":["b3","circle","light","break__fullsize_12"]},{"x":728,"y":251,"w":32,"h":32,"dynamic":true,"cs":["b3","circle","light","break__fullsize_14"]},{"x":665,"y":388,"w":32,"h":32,"dynamic":true,"cs":["b1","circle","light"]},{"x":405,"y":446,"w":18,"h":18,"dynamic":true,"cs":["b2","circle","light"]},{"x":538,"y":322,"w":36,"h":36,"dynamic":true,"cs":["b1","circle","light","break__fullsize_18"]},{"x":327,"y":264,"w":32,"h":32,"dynamic":true,"cs":["b3","circle","light","break__fullsize_20"]},{"x":666,"y":295,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_22"]},{"x":317,"y":387,"w":22,"h":22,"dynamic":true,"cs":["b1","break__fullsize_24"]},{"x":575,"y":408,"w":19,"h":19,"dynamic":true,"cs":["b3","circle","light","break__fullsize_26"]},{"x":673,"y":458,"w":32,"h":32,"dynamic":true,"cs":["b1","circle","light","break__fullsize_28"]},{"x":612,"y":500,"w":32,"h":32,"dynamic":true,"cs":["b3","circle","light","break__fullsize_30"]},{"x":636,"y":562,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_32"]},{"x":761,"y":573,"w":19,"h":19,"dynamic":true,"cs":["b3","circle","light","break__fullsize_34"]},{"x":504,"y":427,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_36"]},{"x":470,"y":488,"w":51,"h":51,"dynamic":true,"cs":["b1","circle","light","break__fullsize_38"]},{"x":558,"y":547,"w":32,"h":32,"dynamic":true,"cs":["b2","circle","light","break__fullsize_40"]},{"x":445,"y":218,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":481,"y":147,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":378,"y":181,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":646,"y":189,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":355,"y":366,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":731,"y":273,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":378,"y":181,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"},{"x":445,"y":218,"w":19,"h":19,"dynamic":true,"cs":["circle","light","break__fullsize_26","coin","collect"],"type":"collect"}] ', '[{"x":8,"y":595,"w":348,"h":33},{"x":361,"y":499,"w":131,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":904,"y":478,"w":100,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":526,"y":414,"w":333,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":1042,"y":632,"w":131,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":-3,"y":6,"w":32,"h":929},{"x":8,"y":907,"w":2552,"h":33},{"x":71,"y":454,"w":225,"h":112,"type":"spawn"},{"x":1478,"y":545,"w":382,"h":7,"dynamic":true,"cs":["purp"]},{"x":2549,"y":1,"w":32,"h":929},{"x":1340,"y":537,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":1648,"y":564,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":1970,"y":462,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":2269,"y":360,"w":31,"h":31},{"x":null,"y":null,"w":0,"h":0},{"x":2251,"y":216,"w":348,"h":33},{"x":2098,"y":345,"w":382,"h":7,"dynamic":true,"cs":["purp"]},{"x":1802,"y":446,"w":382,"h":7,"dynamic":true,"cs":["purp"]},{"x":1247,"y":507,"w":196,"h":24,"dynamic":true,"cs":["purp"]}] ', '[{"x":552,"y":358,"w":160,"h":86},{"x":-2,"y":-5,"w":16,"h":790},{"x":100,"y":667,"w":450,"h":40},{"x":786,"y":-22,"w":16,"h":818},{"x":5,"y":-1,"w":795,"h":33},{"x":4,"y":767,"w":795,"h":33},{"x":338,"y":290,"w":177,"h":41},{"x":205,"y":270,"w":218,"h":15,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":679,"y":316,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_15","purp"]},{"x":693,"y":276,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_17","purp"]},{"x":635,"y":320,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":646,"y":275,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_21","purp"]},{"x":669,"y":238,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_23","purp"]},{"x":362,"y":159,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_23","purp"]},{"x":340,"y":197,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_21","purp"]},{"x":383,"y":199,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_17","purp"]},{"x":383,"y":236,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_15","purp"]},{"x":335,"y":234,"w":36,"h":32,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":586,"y":592,"w":178,"h":152,"type":"spawn"},{"x":103,"y":562,"w":112,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":104,"y":576,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":194,"y":577,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":266,"y":562,"w":112,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":267,"y":576,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":357,"y":577,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":182,"y":457,"w":112,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":183,"y":471,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":273,"y":472,"w":18,"h":86,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":182,"y":348,"w":73,"h":12,"dynamic":true,"cs":["break__fullsize_13","purp"]},{"x":183,"y":366,"w":18,"h":91,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":237,"y":366,"w":18,"h":89,"dynamic":true,"cs":["break__fullsize_19","purp"]},{"x":314,"y":513,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":339,"y":514,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":313,"y":537,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":338,"y":538,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":135,"y":642,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":160,"y":643,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":247,"y":743,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":210,"y":221,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":235,"y":222,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":209,"y":245,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":234,"y":246,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":667,"y":211,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":692,"y":212,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":201,"y":324,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"},{"x":226,"y":325,"w":18,"h":18,"dynamic":true,"cs":["coin","collect"],"type":"collect"}]', '[{"x":41,"y":8,"w":1059,"h":54},{"x":529,"y":249,"w":105,"h":22},{"x":null,"y":null,"w":0,"h":0},{"x":405,"y":297,"w":367,"h":146,"type":"spawn"},{"x":1030,"y":13,"w":84,"h":1047},{"x":33,"y":28,"w":59,"h":1041},{"x":333,"y":528,"w":494,"h":16,"dynamic":true,"cs":["purp"]},{"x":575,"y":550,"w":26,"h":504},{"x":21,"y":1050,"w":1094,"h":72}] '];

  B = require('./libs/Box2dWeb-2.1.a.3.js');

  Array.prototype.remove = function(item) {
    var indx;
    indx = this.indexOf(item);
    if (indx !== -1) {
      return this.splice(indx, 1);
    }
  };

  Array.prototype.random = function() {
    if (this.length === 0) {
      return;
    }
    return this[Math.floor(Math.random() * this.length)];
  };

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.randint = function(max) {
    return parseInt(Math.random() * max);
  };

  root.IDcounter = 0;

  root.getID = function() {
    root.IDcounter += 1;
    return root.IDcounter;
  };

  root.requestAnimFrame = (function() {
    return function(callback) {
      return setTimeout(callback, 1000 / 60);
    };
  })();

  Dynamic = (function() {

    Dynamic.name = 'Dynamic';

    function Dynamic() {
      this.ID = root.getID();
      this.x = (root.randint(700)) + 50;
      this.y = 600;
      this.w = 10;
      this.h = 30;
      this.dynamic = true;
      this.cache = {
        x: -9999,
        y: -9999,
        d: 0
      };
    }

    Dynamic.prototype.get_delta = function() {
      var result;
      result = {};
      if (Math.abs(this.x - this.cache.x) >= 1.0) {
        this.cache.x = this.x;
        result.x = parseInt(this.x);
      }
      if (Math.abs(this.y - this.cache.y) >= 1.0) {
        this.cache.y = this.y;
        result.y = parseInt(this.y);
      }
      if (Math.abs(this.degrees - this.cache.d) >= 1.0) {
        this.cache.d = this.degrees;
        result.d = parseInt(this.degrees);
      }
      return result;
    };

    Dynamic.prototype.state = function() {
      var pos;
      this.degrees = this.body.GetAngle() * (180 / Math.PI);
      pos = this.body.GetPosition();
      this.x = pos.x * root.game.scale - this.w / 2;
      this.y = -pos.y * root.game.scale - this.h / 2;
      return {
        t: this.dynamic,
        ID: this.ID,
        x: this.x,
        y: this.y,
        w: this.w,
        h: this.h,
        cs: this.cs,
        d: this.degrees
      };
    };

    Dynamic.prototype.delta_state = function() {
      var delta, jj, key, pos;
      this.degrees = this.body.GetAngle() * (180 / Math.PI);
      pos = this.body.GetPosition();
      this.x = pos.x * root.game.scale - this.w / 2;
      this.y = -pos.y * root.game.scale - this.h / 2;
      delta = this.get_delta();
      jj = 0;
      for (key in delta) {
        jj += 1;
      }
      if (jj > 0) {
        delta.ID = this.ID;
        return delta;
      }
      return false;
    };

    return Dynamic;

  })();

  Player = (function(_super) {

    __extends(Player, _super);

    Player.name = 'Player';

    function Player(connection) {
      var spawn;
      this.connection = connection;
      this.ID = root.getID();
      spawn = root.game.spawn;
      this.x = (root.randint(spawn.w)) + spawn.x;
      this.y = (root.randint(spawn.h)) + spawn.y;
      this.w = 10;
      this.h = 30;
      this.dynamic = false;
      this.name = 'anon';
      this.keys = [];
      this.contacts = [];
      this.on_ground = 0;
      this.head_clear = true;
      this.max_force = 4;
      this.max_velocity = 6.0;
      this.max_jump = 5.5;
      this.speed = .2;
      this.cache = {
        x: -9999,
        y: -9999,
        d: 0
      };
      this.coins = 0;
      this.type = 'player';
    }

    Player.prototype.set_position = function(x, y) {
      return this.body.SetXForm(new B.b2Vec2((x + this.w / 2) / root.game.scale, -1 * (y + this.h / 2) / root.game.scale), this.body.GetAngle());
    };

    Player.prototype.spawn = function() {
      var sp;
      sp = root.game.spawn;
      this.x = (root.randint(sp.w)) + sp.x;
      this.y = (root.randint(sp.h)) + sp.y;
      return this.set_position(this.x, this.y);
    };

    Player.prototype.delta_state = function() {
      var delta, jj, key, pos;
      this.degrees = this.body.GetAngle() * (180 / Math.PI);
      pos = this.body.GetPosition();
      this.x = pos.x * root.game.scale - this.w / 2;
      this.y = -pos.y * root.game.scale - this.h / 2;
      delta = this.get_delta();
      jj = 0;
      for (key in delta) {
        jj += 1;
      }
      if (jj > 0) {
        delta.ID = this.ID;
        return delta;
      }
      return false;
    };

    Player.prototype.state = function() {
      var pos;
      this.degrees = this.body.GetAngle() * (180 / Math.PI);
      pos = this.body.GetPosition();
      this.x = pos.x * root.game.scale - this.w / 2;
      this.y = -pos.y * root.game.scale - this.h / 2;
      return {
        t: this.dynamic,
        ID: this.ID,
        x: this.x,
        y: this.y,
        w: this.w,
        h: this.h,
        name: this.name,
        color: this.color,
        d: this.degrees,
        coin: this.coins
      };
    };

    Player.prototype.send = function(obj) {
      try {
        return this.connection.send(JSON.stringify(obj));
      } catch (error) {
        console.log('ERROR, failure to send player socket');
        return root.game.close_player(this);
      }
    };

    Player.prototype.keydown = function(code) {
      this.keys.push(code);
      if (code === 32) {
        console.log('on ground', this.on_ground);
        if (this.on_ground) {
          console.log('key', code);
          return this.apply_velocity(0, this.max_jump * .9, true);
        }
      }
    };

    Player.prototype.keyup = function(code) {
      if (__indexOf.call(this.keys, code) >= 0) {
        return this.keys.remove(code);
      }
    };

    Player.prototype.apply_velocity = function(x, y, override) {
      var max, v, vel;
      if (x == null) {
        x = 0;
      }
      if (y == null) {
        y = 0;
      }
      if (override == null) {
        override = false;
      }
      vel = this.body.GetLinearVelocity();
      max = this.max_velocity;
      x = x + vel.x;
      y = y + vel.y;
      if (!override) {
        if (Math.abs(x) > max) {
          x *= max / Math.abs(x);
        }
        if (Math.abs(y) > max) {
          y *= max / Math.abs(y);
        }
        if (vel.y > y) {
          y = vel.y;
        }
      }
      try {
        v = new B.b2Vec2(x, y);
        return this.body.SetLinearVelocity(v);
      } catch (error) {
        return console.log('ERROR: ', B);
      }
    };

    Player.prototype.apply_force = function(x, y) {
      var p, v, vel;
      vel = this.body.GetLinearVelocity();
      x = x * this.max_force;
      y = y * this.max_force;
      v = new B.Common.Math.b2Vec2(x, y);
      p = this.body.GetWorldCenter();
      return this.body.ApplyForce(v, p);
    };

    Player.prototype.update = function() {
      var v, vel;
      vel = this.body.GetLinearVelocity();
      v = new B.b2Vec2(vel.x * .95, vel.y);
      this.body.SetLinearVelocity(v);
      this.on_ground -= .05;
      if (this.on_ground > 0) {
        this.on_ground -= .1;
      } else {
        this.on_ground = 0;
      }
      this.body.m_sweep.a = -.05;
      if (__indexOf.call(this.keys, 37) >= 0) {
        if (this.on_ground) {
          this.apply_velocity(-this.speed, 0.0);
        } else {
          this.apply_velocity(-.1, 0.0);
        }
      }
      if (__indexOf.call(this.keys, 39) >= 0) {
        if (this.on_ground) {
          return this.apply_velocity(this.speed, 0.0);
        } else {
          return this.apply_velocity(.1, 0.0);
        }
      }
    };

    Player.prototype.contact_add = function(entity, point) {};

    Player.prototype.contact_begin = function(entity, point) {
      console.log(entity.type);
      if ((entity.type != null) && entity.type === 'collect') {
        this.coins += 1;
        console.log('coins: ', this.coins);
        root.game.dynamics_to_destroy.push(entity);
        return root.game.broadcast({
          'collect': this.ID
        });
      }
    };

    Player.prototype.contact_persist = function(entity, point) {
      if (point.normal != null) {
        if (point.normal.y < -.5 || point.normal.y > .5) {
          return this.on_ground = 1.0;
        }
      }
    };

    Player.prototype.contact_remove = function(entity, point) {};

    return Player;

  })(Dynamic);

  Game = (function() {

    Game.name = 'Game';

    function Game() {
      var gravity, worldAABB;
      this.scale = 100.0;
      this.mode = 'lobby';
      this.level = 0;
      this.timer = 11;
      this.players = [];
      this.dynamics = [];
      this.spawn = {
        x: 50,
        y: 500,
        w: 700,
        h: 100
      };
      this.dynamics_to_destroy = [];
      worldAABB = new B.b2AABB();
      worldAABB.lowerBound.Set(-60.0, -60.0);
      worldAABB.upperBound.Set(60.0, 60.0);
      gravity = new B.b2Vec2(0.0, -10.0);
      this.world = new B.b2World(worldAABB, gravity, true);
      this.boxes = [];
      console.log(new B.b2ContactListener());
      this.ContactListener = new B.b2ContactListener();
      this.ContactListener.Add = this.contact_begin;
      this.ContactListener.Persist = this.contact_persist;
      this.ContactListener.Remove = this.contact_remove;
      this.world.SetContactListener(this.ContactListener);
      this.mode_time = this.time();
    }

    Game.prototype.time = function() {
      var d;
      d = new Date();
      return d.getTime();
    };

    Game.prototype.contact_add = function(point) {
      var ab;
      ab = root.game.get_contact_entities(point);
      if (ab[0] && (ab[0].contact_add != null)) {
        ab[0].contact_add(ab[1], point);
      }
      if (ab[1] && (ab[1].contact_add != null)) {
        return ab[1].contact_add(ab[0], point);
      }
    };

    Game.prototype.contact_begin = function(point) {
      var ab;
      ab = root.game.get_contact_entities(point);
      if (ab[0] && (ab[0].contact_begin != null)) {
        ab[0].contact_begin(ab[1], point);
      }
      if (ab[1] && (ab[1].contact_begin != null)) {
        return ab[1].contact_begin(ab[0], point);
      }
    };

    Game.prototype.contact_persist = function(point) {
      var ab;
      ab = root.game.get_contact_entities(point);
      if (ab[0] && (ab[0].contact_persist != null)) {
        ab[0].contact_persist(ab[0], point);
      }
      if (ab[1] && (ab[1].contact_persist != null)) {
        return ab[1].contact_persist(ab[1], point);
      }
    };

    Game.prototype.contact_remove = function(point) {
      var ab;
      ab = root.game.get_contact_entities(point);
      if (ab[0] && (ab[0].contact_remove != null)) {
        ab[0].contact_remove(ab[0], point);
      }
      if (ab[1] && (ab[1].contact_remove != null)) {
        return ab[1].contact_remove(ab[1], point);
      }
    };

    Game.prototype.get_contact_entities = function(point) {
      var first, next, result;
      first = point.shape1.m_body;
      next = point.shape2.m_body;
      result = [false, false];
      if (first.GetUserData()) {
        result[0] = first.GetUserData();
      }
      if (next.GetUserData()) {
        result[1] = next.GetUserData();
      }
      return result;
    };

    Game.prototype.load_level = function(n) {
      var d, data, ddd, obj, p, ppp, _i, _j, _k, _len, _len1, _len2, _ref, _ref1;
      this.debug = [];
      _ref = this.boxes;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        d = _ref[_i];
        this.world.DestroyBody(d);
      }
      this.dynamics = [];
      this.boxes = [];
      data = JSON.parse(levels[this.level]);
      for (_j = 0, _len1 = data.length; _j < _len1; _j++) {
        obj = data[_j];
        if (obj.dynamic != null) {
          this.boxes.push(this.make_dynamic_box(obj));
        } else if (obj.type != null) {
          if (obj.type === 'spawn') {
            this.spawn = obj;
          }
        } else {
          this.boxes.push(this.make_static_box(obj));
        }
      }
      _ref1 = this.players;
      for (_k = 0, _len2 = _ref1.length; _k < _len2; _k++) {
        p = _ref1[_k];
        p.spawn();
      }
      this.broadcast({
        load: this.level
      });
      ppp = this.players.map(function(p) {
        return p.state();
      });
      ddd = this.dynamics.map(function(p) {
        return p.state();
      });
      return this.broadcast({
        debrief: ddd.concat(ppp)
      });
    };

    Game.prototype.close_player = function(player) {
      this.players.remove(player);
      this.world.DestroyBody(player.body);
      player.body = null;
      return this.broadcast({
        disconnect: player.ID
      });
    };

    Game.prototype.remove_dynamic = function(dynamic) {
      var _ref;
      this.dynamics.remove(dynamic);
      this.broadcast({
        'remove': dynamic.ID
      });
      if (_ref = dynamic.body, __indexOf.call(this.boxes, _ref) >= 0) {
        this.boxes.remove(dynamic.body);
      }
      this.world.DestroyBody(dynamic.body);
      return dynamic = null;
    };

    Game.prototype.make_dynamic_box = function(obj) {
      var body, bodyDef, new_dynamic, shapeDef;
      new_dynamic = new Dynamic();
      if (obj.w === 0) {
        obj.w = 16;
      }
      if (obj.h === 0) {
        obj.h = 16;
      }
      new_dynamic.w = obj.w;
      new_dynamic.h = obj.h;
      new_dynamic.cs = obj.cs;
      this.dynamics.push(new_dynamic);
      bodyDef = new B.b2BodyDef();
      bodyDef.allowSleep = false;
      bodyDef.type = B.b2Body.b2_dynamicBody;
      bodyDef.position.Set((obj.x + obj.w / 2) / this.scale, -1 * (obj.y + obj.h / 2) / this.scale);
      body = this.world.CreateBody(bodyDef);
      if ((obj.cs != null) && __indexOf.call(obj.cs, 'circle') >= 0) {
        shapeDef = new B.b2CircleDef();
        shapeDef.radius = (obj.w / 2) / this.scale;
      } else {
        shapeDef = new B.b2PolygonDef();
        shapeDef.SetAsBox(obj.w / 2 / this.scale, obj.h / 2 / this.scale);
      }
      shapeDef.density = 1.0;
      shapeDef.friction = 0.2;
      shapeDef.restitution = .2;
      if ((obj.cs != null) && __indexOf.call(obj.cs, 'light') >= 0) {
        shapeDef.density = 0.16;
        shapeDef.restitution = .95;
      }
      body.CreateShape(shapeDef);
      body.SetMassFromShapes();
      console.log(body.GetAngle());
      if ((obj.type != null) && obj.type === 'collect') {
        new_dynamic.type = obj.type;
        body.SetUserData(new_dynamic);
      }
      new_dynamic.body = body;
      return body;
    };

    Game.prototype.make_static_box = function(obj) {
      var groundBody, groundBodyDef, groundShapeDef;
      groundBodyDef = new B.b2BodyDef();
      groundBodyDef.position.Set((obj.x + obj.w / 2) / this.scale, (-1 * (obj.y + obj.h / 2)) / this.scale);
      groundBody = this.world.CreateBody(groundBodyDef);
      groundShapeDef = new B.b2PolygonDef();
      groundShapeDef.friction = 0.3;
      groundShapeDef.restitution = .2;
      groundShapeDef.SetAsBox((obj.w / 2) / this.scale, (obj.h / 2) / this.scale);
      groundBody.CreateShape(groundShapeDef);
      return groundBody;
    };

    Game.prototype.update = function() {
      var diff, limit, p, _i, _len, _ref;
      diff = root.game.time() - root.game.mode_time;
      if (root.game.mode === 'game') {
        limit = 20000;
      } else {
        limit = 6000;
      }
      if (root.game.timer !== parseInt(diff / (limit / 10))) {
        root.game.timer = parseInt(diff / (limit / 10));
        root.game.broadcast({
          'time': parseInt(diff / (limit / 10))
        });
      }
      if (diff > limit) {
        root.game.mode_time = root.game.time();
        if (root.game.mode === 'lobby') {
          root.game.mode = 'game';
          root.game.level = parseInt(Math.random() * levels.length);
          root.game.load_level(root.game.level);
        } else {
          root.game.mode = 'lobby';
          _ref = root.game.players;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            p = _ref[_i];
            p.set_position(Math.random() * 700 + 50, 350 + Math.random() * 30);
          }
          root.game.update_players();
          root.game.broadcast({
            'lobby': true
          });
        }
        console.log(root.game.mode);
      }
      if (root.game.mode === 'game') {
        try {
          root.game.world.Step(1.0 / 60.0, 5);
        } catch (error) {
          console.log("ERROR,", error);
        }
        root.game.update_players();
      }
      return root.requestAnimFrame(root.game.update);
    };

    Game.prototype.update_players = function() {
      var d, delta, dset, p, set, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3, _results;
      _ref = this.dynamics_to_destroy;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        d = _ref[_i];
        this.remove_dynamic(d);
      }
      this.dynamics_to_destroy = [];
      set = [];
      dset = [];
      _ref1 = this.players;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        p = _ref1[_j];
        delta = p.delta_state();
        if (delta) {
          set.push(delta);
        }
      }
      _ref2 = this.dynamics;
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        d = _ref2[_k];
        delta = d.delta_state();
        if (delta) {
          set.push(delta);
        }
      }
      this.broadcast({
        debrief: set
      });
      _ref3 = this.players;
      _results = [];
      for (_l = 0, _len3 = _ref3.length; _l < _len3; _l++) {
        p = _ref3[_l];
        _results.push(p.update());
      }
      return _results;
    };

    Game.prototype.new_connection = function(ws, login) {
      var body, bodyDef, ddd, new_player, ppp, shapeDef;
      new_player = new Player(ws);
      new_player.name = login.name;
      new_player.color = login.color;
      ws.player = new_player;
      this.players.push(new_player);
      bodyDef = new B.b2BodyDef();
      bodyDef.allowSleep = false;
      bodyDef.type = B.b2Body.b2_dynamicBody;
      bodyDef.position.Set((new_player.x + new_player.w / 2) / this.scale, -1 * (new_player.y + new_player.h / 2) / this.scale);
      body = this.world.CreateBody(bodyDef);
      shapeDef = new B.b2PolygonDef();
      shapeDef.SetAsBox(new_player.w / 2 / this.scale, new_player.h / 2 / this.scale);
      shapeDef.density = 1.3;
      shapeDef.friction = 2.0;
      shapeDef.restitution = .2;
      body.CreateShape(shapeDef);
      shapeDef = new B.b2CircleDef();
      shapeDef.radius = (new_player.w * 2 / 2) / this.scale;
      shapeDef.localPosition.y = -.1;
      body.CreateShape(shapeDef);
      body.SetMassFromShapes();
      new_player.body = body;
      body.SetUserData(new_player);
      if (this.mode === 'lobby') {
        new_player.set_position(Math.random() * 700 + 50, 350 + Math.random() * 100);
        new_player.send({
          'lobby': true
        });
      } else {
        new_player.send({
          load: this.level
        });
      }
      this.broadcast({
        connect: [new_player.state()]
      });
      new_player.send({
        self: new_player.ID
      });
      ppp = this.players.map(function(p) {
        return p.state();
      });
      ddd = this.dynamics.map(function(p) {
        return p.state();
      });
      return new_player.send({
        debrief: ppp.concat(ddd)
      });
    };

    Game.prototype.broadcast = function(message) {
      var p, _i, _len, _ref, _results;
      _ref = this.players;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        p = _ref[_i];
        _results.push(p.send(message));
      }
      return _results;
    };

    return Game;

  })();

  root.Player = Player;

  root.game = new Game();

  root.game.load_level(root.game.level);

  root.game.update();

}).call(this);
