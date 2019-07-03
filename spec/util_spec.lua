--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Utility Functions', function()
    describe('_:clone(tabl)', function()
        it('should create deep copy of `tabl`', function()
            local t1 = {a = 1, b = { 3, 2, 1}, c = 2}
            local t2 = _:clone(t1)

            assert.is_false(t1 == t2)
            assert.is_true(t1['b'] == t2['b'])
        end)
    end)
end)