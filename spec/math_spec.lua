--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Math Functions', function()
    describe('_:abs(value)', function()
        it('should return absolute value of `value`', function()
            assert.are.equals(_:abs(4), 4)
            assert.are.equals(_:abs(-4), 4)
        end)
    end)

    describe('_:add(...)', function()
        it('should add together all `...`', function()
            assert.are.equals(_:add(4, 5, 3), 12)
        end)

        it('should combine `value` with `other` (`other` ~= nil)', function()
            assert.are.equals(_:add(4, 6), 10)
        end)
    end)

    describe('_:ceil(value, [precision=0])', function()
        it('rounds up `value` to `precision`', function()
            assert.are.equals(_:ceil(4.006), 5)
            assert.are.equals(_:ceil(6.004, 2), 6.01)
            assert.are.equals(_:ceil(6040, -2), 6100)
        end)
    end)

    -- describe('_:divide(dividend, divisor)', function()
    --     it('divides `dividend` by `divisor`', function()
    --         assert.are.equals(_:divide(6, 4), 1.5)
    --     end)
    --     it('attempts to `dividend` by 0, but fails', function()
    --         assert.has_error(_:divide(2, 0))
    --     end)
    -- end)

    describe('_:floor(value, [precision=0])', function()
        it('rounds down `value` to `precision`', function()
            assert.are.equals(_:floor(4.006), 4)
            assert.are.equals(_:floor(0.046, 2), 0.04)
            assert.are.equals(_:floor(4060, -2), 4000)
        end)
    end)
end)