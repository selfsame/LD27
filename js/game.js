// Generated by CoffeeScript 1.3.1
(function() {
  var coinlost, coinwav, connect_to_socket, short1,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  window.requestAnimFrame = (function() {
    return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function(callback) {
      return window.setTimeout(callback, 1000 / 60);
    };
  })();

  Array.prototype.remove = function(item) {
    var indx;
    indx = this.indexOf(item);
    if (indx !== -1) {
      return this.splice(indx, 1);
    }
  };

  window.v_w = 800;

  window.v_h = 600;

  window.entities = {};

  window.players = {};

  window.dynamics = {};

  short1 = new Audio("audio/short1.mp3");

  coinwav = new Audio("audio/coin.wav");

  coinlost = new Audio("audio/coinlost.wav");

  $('#viewport').css({
    width: window.v_w,
    height: window.v_h
  });

  window.update_entities = function() {
    var e, key;
    for (key in window.entities) {
      e = window.entities[key];
      if (e.avatar != null) {
        if (__indexOf.call(e.to_update, 'x') >= 0) {
          e.avatar.css({
            left: parseInt(e.x)
          });
        }
        if (__indexOf.call(e.to_update, 'y') >= 0) {
          e.avatar.css({
            top: parseInt(e.y)
          });
        }
        if (__indexOf.call(e.to_update, 'd') >= 0) {
          e.avatar.css({
            transform: 'rotate(' + String(e.d * -1) + 'deg)'
          });
        }
        e.to_update = [];
        if (e.ID === window.me) {
          e.avatar.addClass('self');
        }
      }
    }
    return window.requestAnimFrame(update_entities);
  };

  connect_to_socket = function(_name, _color) {
    var ws;
    ws = new WebSocket('ws://' + window.location.hostname + ':8079');
    console.dir(ws);
    ws.onopen = function() {
      return ws.send(JSON.stringify({
        'login': {
          name: _name,
          color: _color
        }
      }));
    };
    ws.onmessage = function(message) {
      var avatar, bubble, c, data, diff, entity, n, o, prop, relative, set, _i, _j, _len, _len1, _ref;
      data = JSON.parse(message.data);
      if (data.time != null) {
        $('.time').html(" " + (10 - parseInt(data.time)));
      }
      if (data.self != null) {
        window.me = data.self;
      }
      if (data.disconnect != null) {
        if ($('#' + data.disconnect)[0] != null) {
          $('#' + data.disconnect).detach();
        }
      }
      if (data.remove != null) {
        if ($('#' + data.remove)[0] != null) {
          $('#' + data.remove).detach();
        }
      }
      if (data.collect != null) {
        if (data.collect === window.me) {
          coinwav.play();
        } else {
          coinlost.play();
        }
        window.entities[data.collect].coin += 1;
        return window.entities[data.collect].avatar.find('.playerscore').html(window.entities[data.collect].coin);
      } else if (data.lobby != null) {
        $('#actors').html('');
        $('#level').html('');
        $('#game').css({
          'left': 0,
          'top': 0
        });
        $('#viewport > .time').hide();
        $('#viewport').addClass('lobify');
        return $('#lobby').css('display', 'block');
      } else if (data.chat != null) {
        if ($('#' + data.who)[0] != null) {
          bubble = $('<p class="bubble" >' + data.chat + '</p>');
          $('#' + data.who).children('.chat').html(bubble);
          bubble.css('margin-top', -1 * bubble.height() - 25);
          return bubble.delay(2000).animate({
            opacity: 0.0
          }, 300, function() {
            return bubble.detach();
          });
        }
      } else if (data.load != null) {
        short1.play();
        $('#lobby').css('display', 'none');
        $('#viewport').removeClass('lobify');
        $('#viewport > .time').show();
        $('#viewport').css('display', 'block');
        console.log('load');
        n = data.load;
        $('#dynamics').html('');
        $('#actors').html('');
        window.entities = {};
        $('#game').css({
          'left': 0,
          'top': 0
        });
        return $.get('./levels/level' + n + '.html', function(data) {
          $('#level').html(data);
          return $('#level').find('.dynamic').detach();
        });
      } else if ((data.debrief != null) || (data.connect != null)) {
        if (!($('body').children('#debug')[0] != null)) {
          $('body').append('<div id="debug"></div>');
        }
        set = data.debrief || data.connect;
        $('#debug').html('<p>' + JSON.stringify(set).length + '  ' + '</p>');
        for (_i = 0, _len = set.length; _i < _len; _i++) {
          entity = set[_i];
          if (entity.ID) {
            if (!window.entities[entity.ID]) {
              window.entities[entity.ID] = entity;
              if ((entity.t != null) && entity.t === true) {
                avatar = $('<div class="player dynamic", id="' + entity.ID + '">\
								</div>');
              } else {
                avatar = $('<div class="player", id="' + entity.ID + '">\
								<div class="chat"></div><div class="playername"></div><div class="playerscore">0</div></div>');
              }
              window.entities[entity.ID].avatar = avatar;
              avatar.css({
                width: entity.w,
                height: entity.h,
                left: entity.x,
                top: entity.y,
                transform: 'rotate(' + String(entity.d * -1) + 'deg)'
              });
              if (entity.coin) {
                avatar.find('.playerscore').html(entity.coin);
              }
              if (entity.color) {
                avatar.css('background-color', entity.color);
              }
              if (entity.cs) {
                _ref = entity.cs;
                for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
                  c = _ref[_j];
                  avatar.addClass(c);
                }
              }
              entity.to_update = [];
              if (entity.t === true) {
                $('#actors').append(avatar);
              } else {
                $('#dynamics').append(avatar);
              }
              console.log('creating ', entity.ID, avatar);
            } else {
              for (prop in entity) {
                if (prop !== 'ID') {
                  if (__indexOf.call(window.entities[entity.ID].to_update, prop) < 0) {
                    window.entities[entity.ID].to_update.push(prop);
                  }
                }
                window.entities[entity.ID][prop] = entity[prop];
              }
            }
          }
        }
        if ($('.player.self').length > 0) {
          o = {
            top: parseInt($('.player.self').css('top')),
            left: parseInt($('.player.self').css('left'))
          };
          relative = o.top + parseInt($('#game').css('top'));
          if (relative > window.v_h * .6) {
            diff = window.v_h * .6 - relative;
            $('#game').css('top', parseInt($('#game').css('top')) + diff + 'px');
          } else if (relative < window.v_h * .4) {
            diff = window.v_h * .4 - relative;
            $('#game').css('top', parseInt($('#game').css('top')) + diff + 'px');
          }
          relative = o.left + parseInt($('#game').css('left'));
          if (relative > window.v_w * .6) {
            diff = window.v_w * .6 - relative;
            return $('#game').css('left', parseInt($('#game').css('left')) + diff + 'px');
          } else if (relative < window.v_w * .4) {
            diff = window.v_w * .4 - relative;
            return $('#game').css('left', parseInt($('#game').css('left')) + diff + 'px');
          }
        }
      }
    };
    window.update_entities();
    window.keys = [];
    $(window).keydown(function(e) {
      var _ref;
      if ($('#chat').is(':focus')) {
        if (e.keyCode === 13) {
          ws.send(JSON.stringify({
            'chat': $('#chat').val()
          }));
          return $('#chat').val('');
        }
      } else if (_ref = e.keyCode, __indexOf.call(window.keys, _ref) < 0) {
        window.keys.push(e.keyCode);
        return ws.send(JSON.stringify({
          'keydown': e.keyCode
        }));
      }
    });
    $(window).keyup(function(e) {
      window.keys.remove(e.keyCode);
      window.keys.remove(e.keyCode);
      return ws.send(JSON.stringify({
        'keyup': e.keyCode
      }));
    });
    return window.compile_level = function(url) {
      return $.get('./levels/' + url, function(data) {
        var child, recurse, result, temp, _i, _len, _ref;
        result = [];
        temp = $('<div></div>');
        temp.append($(data));
        recurse = function(el) {
          var b, c, child, cs, _i, _j, _len, _len1, _ref, _ref1, _results;
          if (!$(el).hasClass('no_collision')) {
            b = {
              x: parseInt($(el).css('left')),
              y: parseInt($(el).css('top')),
              w: parseInt($(el).outerWidth()),
              h: parseInt($(el).outerHeight())
            };
            if ($(el).hasClass('dynamic')) {
              b.dynamic = true;
            }
            if ($(el).hasClass('dynamic' || $(el).hasClass('collect'))) {
              cs = [];
              _ref = $(el).attr('class').split(' ');
              for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                c = _ref[_i];
                if (c && c !== 'dynamic') {
                  cs.push(c);
                }
              }
              if (cs.length > 0) {
                b.cs = cs;
              }
            }
            if ($(el).hasClass('collect')) {
              b.type = 'collect';
            }
            if ($(el).hasClass('spawn')) {
              b.type = 'spawn';
            }
            result.push(b);
            _ref1 = $(el).children();
            _results = [];
            for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
              child = _ref1[_j];
              _results.push(recurse(child));
            }
            return _results;
          }
        };
        _ref = $(temp).children();
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          child = _ref[_i];
          recurse(child);
        }
        return console.log(JSON.stringify(result));
      });
    };
  };

  $('#connect').click(function(e) {
    var color, name;
    name = $('#username').val();
    color = $('.color_choice.active').first().css('background-color');
    connect_to_socket(name, color);
    $('.connectbox').css('display', 'none');
    return $('#connected').css('display', 'block');
  });

  $('.color_choice').click(function(e) {
    $('.color_choice').removeClass('active');
    return $(this).addClass('active');
  });

}).call(this);
