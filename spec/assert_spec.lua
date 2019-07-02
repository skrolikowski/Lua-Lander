--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Assert Functions', function()
    describe('_:assertNotNil(name, var)', function()
        it('should assert when `var` is null', function()
            assert.has_errors(function() _:assertNotNil('name', nil) end)
        end)
    end)
end)