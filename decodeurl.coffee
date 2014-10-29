iconv = require 'iconv-lite'

to_chinese = (buff) ->
  _every_is_chinese = (str) ->
    is_chinese = true
    for i in [0...str.length]
      char_code = str.charCodeAt(i)
      if not (0 < char_code < 128 or 19968 <= char_code <= 40869)
        is_chinese = false
        break

    return is_chinese

  str = iconv.decode(buff, 'utf-8') 
  return str if _every_is_chinese(str)

  str = iconv.decode(buff, 'gbk') 
  return str if _every_is_chinese(str)

  return null


module.exports = decodeurl = (str) ->
  r = /(%[0-9A-Fa-f]{2})+/g
  url_hex_parts = []
  while m = r.exec(str)
    url_hex_parts.push m[0]
   
  for hex in url_hex_parts
    buff = new Buffer(hex.replace(/%/g, ''), 'hex')
    decoded_str = to_chinese(buff)

    if decoded_str
      str = str.replace hex, decoded_str

  return str
