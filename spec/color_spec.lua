--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Color Functions', function()
    describe('_:color(...)', function()
        it('should generate r, g, b-values if 1 argument is set', function()
            assert.are.same({ _:color('black') }, { 0, 0, 0 })
            assert.are.same({ _:color('white') }, { 1, 1, 1 })
            assert.are.same({ _:color('#FED7D7') }, { 0.996078, 0.843137, 0.843137 })
            assert.are.same({ _:color('#38A169') }, { 0.219608, 0.631373, 0.411765 })
            assert.are.same({ _:color('yellow-900') }, { 0.454902, 0.258824, 0.062745 })
            assert.are.same({ _:color('blue-100') }, { 0.921569, 0.972549, 1 })
        end)

        it('should generate an error if color cannot be identified', function()
            assert.has.errors(function() _:color('fake') end)
            assert.has.errors(function() _:color('#38') end)
        end)

        it('should generate r, g, b-values if 2+ arguments are set', function()
            assert.are.same({ _:color('black', 'white') }, { 0.5, 0.5, 0.5 })
        end)
    end)
end)