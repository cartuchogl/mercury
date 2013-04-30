#= require spec_helper
#= require mercury/core/extensions/object
#= require extra/querystring
#= require extra/compare_objects

describe "Object", ->

  describe ".toParams", ->

    it "returns the expected params from an object", ->
      obj =
        arr: [1, 2, {foo: 'bar'}]
        str: 'foo'
        obj: {arr: [1, 2, {foo: 'bar'}], str: 'foo', obj: {bar: 'baz'}}

      expect(__compare_objs(obj, _querystring.parse(Object.toParams(obj)))).to.be.true

    it "need escape for url", ->
      obj =
        "ar/r": [1, 2, {"fo;o": 'b&ar'}]
        "st r": 'fo"o'
        obj: {arr: [1, 2, {foo: 'bar'}], str: 'fóo', obj: {bar: 'baz'}}

      expect(__compare_objs(obj, _querystring.parse(Object.toParams(obj)))).to.be.true
