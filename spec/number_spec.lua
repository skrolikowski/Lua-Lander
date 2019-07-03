--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Number Functions', function()
    describe('_:clamp(num, min, max)', function()
        it('should clamp `num` so it fits between `min` and `max` values', function()
            assert.are.equals(_:clamp(-5, -1, 2), -1)
            assert.are.equals(_:clamp(0, -1, 2), 0)
            assert.are.equals(_:clamp(3, -1, 2), 2)
        end)
    end)

    describe('_:lerp(num, min, max)', function()
        it('should linear interpolate `num` between `min` and `max` values', function()
            assert.are.equals(_:lerp(0.3, 10, 20), 13)
            assert.are.equals(_:lerp(0.75, 0, 100), 75)
        end)
    end)

    describe('_:mapTo(num, minSource, maxSource, minDest, maxDest)', function()
        it('should map `num` using one range `minSource/maxSource` to another range `minDest/maxDest`', function()
            assert.are.equals(_:mapTo(0.5, 1, 2, 10, 20), 5)
            assert.are.equals(_:mapTo(9, 0, 1, 0, 25), 225)
        end)
    end)

    describe('_:norm(num, [min=0], [max=1])', function()
        it('should linear interpolate `num` between `min` and `max` values', function()
            assert.are.equals(_:norm(5, 0, 10), 0.5)
            assert.are.equals(_:norm(5, 4, 8), 0.25)
            assert.are.equals(_:norm(9, 4, 8), 1.25)
        end)
    end)
end)