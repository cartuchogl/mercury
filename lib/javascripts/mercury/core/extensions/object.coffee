# hacked from http://stackoverflow.com/questions/1714786/querystring-encoding-of-a-javascript-object
serialize = (obj, prefix)->
  str = []
  for p, v of obj
    k = if prefix then prefix + "[" + p + "]" else p
    str.push if typeof v == "object"
      serialize(v, k)
    else
      encodeURIComponent(k) + "=" + encodeURIComponent(v)
  str.join "&"

Object.toParams = serialize
