// Generated by CoffeeScript 1.7.1
(function() {
  var decodeurl, iconv, jschardet, to_chinese, us;

  iconv = require('iconv-lite');

  jschardet = require('jschardet');

  us = require('underscore');

  to_chinese = function(buff) {
    var detect_encoding, str, _every_is_chinese;
    _every_is_chinese = function(str) {
      var unicode, _i, _ref, _results;
      unicode = us.map((function() {
        _results = [];
        for (var _i = 0, _ref = str.length; 0 <= _ref ? _i < _ref : _i > _ref; 0 <= _ref ? _i++ : _i--){ _results.push(_i); }
        return _results;
      }).apply(this), function(i) {
        return str.charCodeAt(i);
      });
      return us.every(unicode, function(u) {
        var result;
        result = us.some([(0x00 <= u && u <= 0xFF), (0x2000 <= u && u <= 0x206F), (0x3400 <= u && u <= 0x4DB5), (0x4E00 <= u && u <= 0x9FBB), (0xF900 <= u && u <= 0xFA2D), (0xFA30 <= u && u <= 0xFA6A), (0xFA70 <= u && u <= 0xFAD9), (0x20000 <= u && u <= 0x2A6D6), (0x2F800 <= u && u <= 0x2FA1D), (0xFF00 <= u && u <= 0xFFEF), (0x2E80 <= u && u <= 0x2EFF), (0x3000 <= u && u <= 0x303F), (0x31C0 <= u && u <= 0x31EF), u === 0x2018 || u === 0x2019 || u === 0x201D || u === 0x201D]);
        return result;
      });
    };
    detect_encoding = jschardet.detect(buff);
    if ((detect_encoding != null ? detect_encoding.confidence : void 0) >= 0.98 && iconv.encodingExists(detect_encoding.encoding)) {
      return iconv.decode(buff, detect_encoding.encoding);
    }
    str = iconv.decode(buff, 'utf-8');
    if (_every_is_chinese(str)) {
      return str;
    }
    str = iconv.decode(buff, 'gbk');
    if (_every_is_chinese(str)) {
      return str;
    }
    return null;
  };

  module.exports = decodeurl = function(str) {
    var buff, decoded_str, hex, m, r, url_hex_parts, _i, _len;
    r = /(%[0-9A-Fa-f]{2})+/g;
    url_hex_parts = [];
    while (m = r.exec(str)) {
      url_hex_parts.push(m[0]);
    }
    for (_i = 0, _len = url_hex_parts.length; _i < _len; _i++) {
      hex = url_hex_parts[_i];
      buff = new Buffer(hex.replace(/%/g, ''), 'hex');
      decoded_str = to_chinese(buff);
      if (decoded_str) {
        str = str.replace(hex, decoded_str);
      }
    }
    return str;
  };

}).call(this);
