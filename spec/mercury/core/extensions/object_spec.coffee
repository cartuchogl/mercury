#= require spec_helper
#= require mercury/core/extensions/object

describe "Object", ->

  describe ".toParams", ->

    it "returns the expected params from an object", ->
      obj =
        arr: [1, 2, {foo: 'bar'}]
        str: 'foo'
        obj: {arr: [1, 2, {foo: 'bar'}], str: 'foo', obj: {bar: 'baz'}}

      expect(Object.toParams(obj)).to.eq(
        "arr%5B0%5D=1&arr%5B1%5D=2&arr%5B2%5D%5Bfoo%5D=bar&str=foo&obj%5Barr%5D%5B0%5D=1&obj%5Barr%5D%5B1%5D=2&obj%5Barr%5D%5B2%5D%5Bfoo%5D=bar&obj%5Bstr%5D=foo&obj%5Bobj%5D%5Bbar%5D=baz"
      )

    it "need escape for url", ->
      obj =
        "ar/r": [1, 2, {"fo;o": 'b&ar'}]
        "st r": 'fo"o'
        obj: {arr: [1, 2, {foo: 'bar'}], str: 'fóo', obj: {bar: 'baz'}}

      expect(Object.toParams(obj)).to.eq(
        "ar%2Fr%5B0%5D=1&ar%2Fr%5B1%5D=2&ar%2Fr%5B2%5D%5Bfo%3Bo%5D=b%26ar&st%20r=fo%22o&obj%5Barr%5D%5B0%5D=1&obj%5Barr%5D%5B1%5D=2&obj%5Barr%5D%5B2%5D%5Bfoo%5D=bar&obj%5Bstr%5D=f%C3%B3o&obj%5Bobj%5D%5Bbar%5D=baz"
      )
