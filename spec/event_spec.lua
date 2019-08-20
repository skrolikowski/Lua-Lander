--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Event Functions', function()
    local value = 0
    local addX, addY, subX, subY

    setup(function()
        -- create event callbacks
        add = function(n) value = value + n end
        mul = function(n) value = value * n end
        sub = function(n) value = value - n end
        div = function(n) value = value / n end
    end)

    before_each(function()
        _:on('up', add, mul)  -- Add multiple,
        _:on('down', sub)     -- or..
        _:on('down', div)     -- one at a time.
    end)

    after_each(function()
        _:off('up', 'down')
    end)

    describe('_:on(name)', function()
        it('should be able to register new events', function()
            assert.are.same(_.E['up'], { add, mul })
            assert.are.same(_.E['down'], { sub, div })
        end)

        it('should be able to unregister existing events', function()
            _:off('up')

            assert.is_nil(_.E['up'])
            assert.is_not_nil(_.E['down'])
        end)

        it('should be able to unregister multiple events at once', function()
            _:off('up', 'down')

            assert.is_nil(_.E['up'])
            assert.is_nil(_.E['down'])
        end)

        it('should be able to dispatch events with arguments', function()
            _:dispatch('up', 4)
            assert.are.same(value, 16)

            _:dispatch('down', 2)
            assert.are.same(value, 7)
        end)
    end)
end)