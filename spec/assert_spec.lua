--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Assert Functions', function()
    describe('_:assertArgument(name, var, expect, [default])', function()
        it('should assert when argument has incorrect type', function()
            assert.has.errors(function() _:assertArgument('name', 10, 'string') end)
            assert.has.errors(function() _:assertArgument('age', '23', 'number') end)
        end)

        it('should set default when argument is nil', function()
            assert.are.equals(_:assertArgument('pattern', nil, 'string', '%s+'), '%s+')
            assert.are.equals(_:assertArgument('age', nil, 'number', 21), 21)
        end)

        it('should ignore assert when arguments have correct data type', function()
            assert.has_no.errors(function() _:assertArgument('name', 'John Doe', 'string') end)
            assert.has_no.errors(function() _:assertArgument('age', 23, 'number') end)
        end)
    end)

    -- describe('_:assertEqual(name, ...)', function()
    --     it('should assert when values aren\'t equal', function()
    --         assert.has.errors(function() _:assertEqual('name', 2, 2, 3) end)
    --         assert.has.errors(function() _:assertEqual('name', {a = 1, b = 2}, { a = 1, b = 3}) end)
    --     end)

    --     it('should ignore assert when values are equal', function()
    --         assert.has_no.errors(function() _:assertEqual('name', 2, 2, 2) end)
    --         assert.has_no.errors(function() _:assertEqual('name', {a = 1, b = 2}, { a = 1, b = 2}) end)
    --     end)
    -- end)

    describe('_:assertEqualSize(name, ...)', function()
        it('should assert when values aren\'t equal in size', function()
            assert.has.errors(function() _:assertEqualSize('tables', {1, 2, 3, 4}, {1, 2, 3}) end)
            assert.has.errors(function() _:assertEqualSize('numbers', 33, 3, 333) end)
            assert.has.errors(function() _:assertEqualSize('strings', 'long', 'short') end)
        end)

        it('should ignore assert when values are equal in size', function()
            assert.has_no.errors(function() _:assertEqualSize('tables', {1, 2}, {1, 2}, {1, 2}) end)
            assert.has_no.errors(function() _:assertEqualSize('numbers', 3, 3, 3, 3) end)
            assert.has_no.errors(function() _:assertEqualSize('strings', 'test', 'long') end)
        end)
    end)

    describe('_:assertIsBoolean(name, var)', function()
        it('should assert when `var` is not a boolean', function()
            assert.has.errors(function() _:assertIsBoolean('test', 'true') end)
            assert.has.errors(function() _:assertIsBoolean('test', 'false') end)
        end)

        it('should ignore assert when `var` is a boolean', function()
            assert.has_no.errors(function() _:assertIsBoolean('test', true) end)
            assert.has_no.errors(function() _:assertIsBoolean('test', false) end)
        end)
    end)

    describe('_:assertIsNumber(name, var)', function()
        it('should assert when `var` is not a number', function()
            assert.has.errors(function() _:assertIsNumber('age', 'thirty-five') end)
        end)

        it('should ignore assert when `var` is a number', function()
            assert.has_no.errors(function() _:assertIsNumber('age', 35) end)
        end)
    end)

    describe('_:assertIsRegexPattern(name, var)', function()
        it('should assert when `var` is not a regex pattern', function()
            assert.has.errors(function() _:assertIsRegexPattern('pattern', 'abc') end)
        end)

        it('should ignore assert when `var` is a regex pattern', function()
            assert.has_no.errors(function() _:assertIsRegexPattern('pattern', '[abc]') end)
            assert.has_no.errors(function() _:assertIsRegexPattern('pattern', '[^,%s+]') end)
        end)
    end)

    describe('_:assertIsString(name, var)', function()
        it('should assert when `var` is not a string', function()
            assert.has.errors(function() _:assertIsString('name', 79) end)
        end)

        it('should ignore assert when `var` is a string', function()
            assert.has_no.errors(function() _:assertIsString('name', 'Seven of Nine') end)
        end)
    end)

    describe('_:assertIsTable(name, var)', function()
        it('should assert when `var` is not a table', function()
            assert.has.errors(function() _:assertIsTable('name', 'abc') end)
        end)

        it('should ignore assert when `var` is a table', function()
            assert.has_no.errors(function() _:assertIsTable('name', {'a', 'b', 'c'}) end)
        end)
    end)

    describe('_:assertMinSize(name, var, expect)', function()
        it('should assert when `var` < `expect` size', function()
            assert.has.errors(function() _:assertMinSize('age', 20, 21) end)
        end)

        it('should ignore assert when `var` >= `expect` size', function()
            assert.has_no.errors(function() _:assertMinSize('age', 21, 21) end)
            assert.has_no.errors(function() _:assertMinSize('age', 22, 21) end)
        end)
    end)

    describe('_:assertMaxSize(name, var, expect)', function()
        it('should assert when `var` > `expect` size', function()
            assert.has.errors(function() _:assertMaxSize('age', 22, 21) end)
        end)

        it('should ignore assert when `var` <= `expect` size', function()
            assert.has_no.errors(function() _:assertMaxSize('age', 21, 21) end)
            assert.has_no.errors(function() _:assertMaxSize('age', 20, 21) end)
        end)
    end)

    describe('_:assertNotNil(name, var)', function()
        it('should assert when `var` is null', function()
            assert.has.errors(function() _:assertNotNil('name', nil) end)
        end)

        it('should ignore assert when `var` is not null', function()
            assert.has_no.errors(function() _:assertNotNil('name', 10) end)
        end)
    end)

    describe('_:assertNotZero(name, var)', function()
        it('should assert when `var` is 0', function()
            assert.has.errors(function() _:assertNotZero('name', 0) end)
        end)

        it('should ignore assert when `var` is not 0', function()
            assert.has_no.errors(function() _:assertNotZero('name', 10) end)
        end)
    end)
end)