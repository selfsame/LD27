// Generated by CoffeeScript 1.3.1
(function() {
  var Box2D, IDcounter, Player, Sim, WebSocketServer, fs, game, getID, randint, util, winston, wss;

  util = require("util");

  Box2D = require('./libs/Box2dWeb-2.1.a.3.js');

  Sim = require('./simulation.js');

  fs = require('fs');

  winston = require('winston');

  winston.add(winston.transports.File, {
    filename: 'console.log'
  });

  winston.handleExceptions(new winston.transports.File({
    filename: 'stderr.log'
  }));

  winston.exitOnError = true;

  winston.info('start winston logs');

  Array.prototype.remove = function(item) {
    var indx;
    indx = this.indexOf(item);
    if (indx !== -1) {
      return this.splice(indx, 1);
    }
  };

  randint = function(max) {
    return parseInt(Math.random() * max);
  };

  IDcounter = 0;

  getID = function() {
    IDcounter += 1;
    return IDcounter;
  };

  game = Sim.game;

  Player = Sim.Player;

  WebSocketServer = require("ws").Server;

  wss = new WebSocketServer({
    port: 8079
  });

  wss.on("connection", function(ws) {
    ws.on("message", function(message) {
      var d, stamp;
      message = JSON.parse(message);
      if (typeof message === 'object') {
        if (message.login != null) {
          return Sim.game.new_connection(ws, message.login);
        } else if (ws.player != null) {
          if (message.ping != null) {
            ws.player.send({
              'pong': new Date().getTime()
            });
          }
          if (message.chat != null) {
            if (message.chat.slice(0, 7) === "&admin:") {
              Sim.game.admin(message.chat.split("&admin:")[1]);
            } else {
              d = new Date();
              stamp = d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
              winston.info('[' + stamp + '] ' + ws.player.name + ':', message.chat);
              Sim.game.broadcast({
                'chat': message.chat,
                'who': ws.player.ID
              });
            }
          }
          if (message.keydown != null) {
            ws.player.keydown(message.keydown);
          }
          if (message.keyup != null) {
            return ws.player.keyup(message.keyup);
          }
        }
      }
    });
    ws.on("close", function(message) {
      Sim.game.players.remove(ws.player);
      Sim.game.world.DestroyBody(ws.player.body);
      ws.player.body = null;
      Sim.game.broadcast({
        disconnect: ws.player.ID
      });
      return winston.info('-CONNECT');
    });
    return ws.on('error', function(error) {
      return console.log('Client #%d error: %s', ws.player.ID, error.message);
    });
  });

}).call(this);
