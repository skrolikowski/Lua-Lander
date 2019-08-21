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

    describe('_:colorByName(value)', function()
        it('should generate r, g, b-values if color by `name` found, other wise error', function()
            assert.are.same({ _:colorByName('gray-100') }, { 0.968627, 0.980392, 0.988235 })
            assert.are.same({ _:colorByName('red-800') },  { 0.607843, 0.172549, 0.172549 })
            -- Validation test
            assert.has.errors(function() _:colorByName('gray-111') end, 'Color `gray-111` does not exist.')
        end)
    end)

    describe('_:colorByHex(value)', function()
        it('should generate r, g, b-values if color by `hex` found, other wise error', function()
            assert.are.same({ _:colorByHex('#FED7D7') }, { 0.996078, 0.843137, 0.843137 })
            assert.are.same({ _:colorByHex('#38A169') }, { 0.219608, 0.631373, 0.411765 })
            -- Validation test
            assert.has.errors(function() _:colorByHex('#38') end, 'Invalid hex format; acceptable formats: (i.e. #FFEEEE, #AAA)')
        end)
    end)
end)