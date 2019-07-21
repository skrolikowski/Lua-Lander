--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Lang Functions', function()
    describe('_:is_(var)', function()
        it('should return true if `var` is native Lander property, otherwise false', function()
            assert.are.equals(_:is_(123), false)
            assert.are.equals(_:is_('fakeFunction'), false)
            assert.are.equals(_:is_('istruthy'), false)
            assert.are.equals(_:is_(function(v) return _:isTruthy(v) end), false)
            assert.are.equals(_:is_(_.isTruthy), false)
            assert.are.equals(_:is_('isTruthy'), true)
        end)
    end)

    describe('_:isArray(var)', function()
        it('should return true if `var` is an array, otherwise false', function()
            assert.are.equals(_:isArray({}), true)
            assert.are.equals(_:isArray({a = 1, 2, 'c'}), false)
            assert.are.equals(_:isArray({a = 1, b = 2}), false)
            assert.are.equals(_:isArray({false, true}), true)
            assert.are.equals(_:isArray({1, 'b', 'c', 4}), true)
        end)
    end)

    describe('_:isBoolean(var)', function()
        it('should return true if `var` is not a boolean value, otherwise false', function()
            assert.are.equals(_:isBoolean('true'), false)
            assert.are.equals(_:isBoolean(true), true)
        end)
    end)

    describe('_:isEmpty(var)', function()
        it('should return true if `var` is an empty value, otherwise false', function()
            assert.are.equals(_:isEmpty(''), true)
            assert.are.equals(_:isEmpty('abc'), false)
            assert.are.equals(_:isEmpty(false), true)
            assert.are.equals(_:isEmpty(true), false)
            assert.are.equals(_:isEmpty(0), true)
            assert.are.equals(_:isEmpty(1), false)
            assert.are.equals(_:isEmpty({}), true)
            assert.are.equals(_:isEmpty({1, 2, 3}), false)
            assert.are.equals(_:isEmpty(nil), true)
        end)
    end)

    describe('_:isEqual(var1, var2)', function()
        it('should return true if `var1` == `var2`, otherwise false', function()
            -- boolean
            assert.is_true(_:isEqual(true, true))
            assert.is_false(_:isEqual(true, false))
            -- number
            assert.is_true(_:isEqual(1, 1))
            assert.is_false(_:isEqual(1, 2))
            -- string
            assert.is_true(_:isEqual('foo', 'foo'))
            assert.is_false(_:isEqual('foo', 'bar'))
            -- table, simple
            assert.is_true(_:isEqual({'a', 'b', 'c'}, {'a', 'b', 'c'}))
            assert.is_false(_:isEqual({'a', 'b', 'c'}, {'a', 'c', 'b'}))
            -- table, simple, unordered named keys
            assert.is_true(_:isEqual({a = 1, b = 5, c = 3}, {c = 3, b = 5, a = 1}))
            assert.is_false(_:isEqual({a = 1, b = 5, c = 3}, {c = 6, b = 10, a = 2}))
            -- table, complex
            local co = coroutine.create(function(v) return v end)
            local func = (function(v) return v * 2 end)
            local t1 = {
                a = {1, 2, 3},
                b = false,
                c = {
                    a = { co, func },
                    'hello world!'
                }
            }
            local t2 = {
                a = {3, 2, 1},
                c = true,
                b = {
                    a = { co, func },
                    'goodbye world!'
                }
            }
            assert.is_true(_:isEqual(t1, t1))
            assert.is_true(_:isEqual(t1['c']['a'], t2['b']['a']))
            assert.is_false(_:isEqual(t1, t2))
            assert.is_false(_:isEqual(t1['c'], t2['b']))
        end)
    end)

    describe('_:isEven(var)', function()
        it('should return true if `var` is an even number, otherwise false', function()
            assert.is_false(_:isEven(-1))
            assert.is_false(_:isEven(147))
            assert.is_false(_:isEven('abc'))
            assert.is_true(_:isEven(0))
            assert.is_true(_:isEven(168))

        end)
    end)

    describe('_:isFalsey(var)', function()
        it('should return true if `var` is falsey, otherwise false', function()
            assert.are.equals(_:isFalsey(nil), true)
            assert.are.equals(_:isFalsey(false), true)
            assert.are.equals(_:isFalsey('abc'), false)
            assert.are.equals(_:isFalsey(42), false)
            assert.are.equals(_:isFalsey(function() end), false)
        end)
    end)

    describe('_:isFunction(var)', function()
        it('should return true if `var` is not a function, otherwise false', function()
            assert.are.equals(_:isFunction(function() return 'Hello World!' end), true)
            assert.are.equals(_:isFunction('Hello World!'), false)
            assert.are.equals(_:isFunction('isEqual'), true)
            assert.are.equals(_:isFunction('madeUpFunction'), false)
            assert.are.equals(_:isFunction(function(v, k) return v end), true)
            assert.are.equals(_:isFunction('abc'), false)
        end)
    end)

    describe('_:isNaN(var)', function()
        it('should return true if `var` is not a number, otherwise false', function()
            assert.are.equals(_:isNaN('123'), true)
            assert.are.equals(_:isNaN(123), false)
        end)
    end)

    describe('_:isNegative(var)', function()
        it('should return true if `var` is a negative number, otherwise false', function()
            assert.are.equals(_:isNegative('abc'), false)
            assert.are.equals(_:isNegative(-2), true)
            assert.are.equals(_:isNegative(3), false)
        end)
    end)

    describe('_:isNil(var)', function()
        it('should return true if `var` is nil, otherwise false', function()
            assert.are.equals(_:isNil('abc'), false)
            assert.are.equals(_:isNil(nil), true)
        end)
    end)

    describe('_:isNotNil(var)', function()
        it('should return true if `var` is not nil, otherwise false', function()
            assert.are.equals(_:isNotNil('abc'), true)
            assert.are.equals(_:isNotNil(nil), false)
        end)
    end)

    describe('_:isNumber(var)', function()
        it('should return true if `var` is a number, otherwise false', function()
            assert.are.equals(_:isNumber('abc'), false)
            assert.are.equals(_:isNumber(42), true)
        end)
    end)

    describe('_:isOdd(var)', function()
        it('should return true if `var` is an even number, otherwise false', function()
            assert.is_false(_:isOdd(0))
            assert.is_false(_:isOdd(168))
            assert.is_false(_:isOdd('abc'))
            assert.is_true(_:isOdd(-1))
            assert.is_true(_:isOdd(147))

        end)
    end)

    describe('_:isPositive(var)', function()
        it('should return true if `var` is a positive number, otherwise false', function()
            assert.are.equals(_:isPositive('abc'), false)
            assert.are.equals(_:isPositive(-2), false)
            assert.are.equals(_:isPositive(3), true)
        end)
    end)

    pending('_:isRegexPattern(var)', function()
        it('should return true if `var` is a regex pattern, otherwise false', function()
            assert.are.equals(_:isRegexPattern('abc'), false)
            assert.are.equals(_:isRegexPattern('^abc'), false)
            assert.are.equals(_:isRegexPattern('[abc]'), true)
            assert.are.equals(_:isRegexPattern('%a+'), true)
        end)
    end)

    describe('_:isSequence(var)', function()
        it('should return true if `var` is a sequence, otherwise false', function()
            assert.are.equals(_:isSequence({}), true)
            assert.are.equals(_:isSequence({1, 3, 5, 6, 7}), true)
            assert.are.equals(_:isSequence({a = 1, b = 3, 4, 8}), false)
            assert.are.equals(_:isSequence({1, 4, 2, 10, 6}), false)
        end)
    end)

    describe('_:isSet(var)', function()
        it('should return true if `var` is a set, otherwise false', function()
            assert.are.equals(_:isSet({}), true)
            assert.are.equals(_:isSet({3, 3, 5, 6, 6}), false)
            assert.are.equals(_:isSet({a = 1, b = 3, c = 4, 5, 8}), false)
            assert.are.equals(_:isSet({1, 4, 2, 10, 6}), true)
        end)
    end)

    describe('_:isString(var)', function()
        it('should return true if `var` is a string, otherwise false', function()
            assert.are.equals(_:isString('abc'), true)
            assert.are.equals(_:isString(42), false)
        end)
    end)

    describe('_:isTable(var)', function()
        it('should return true if `var` is a table, otherwise false', function()
            assert.are.equals(_:isTable('abc'), false)
            assert.are.equals(_:isTable({'a', 'b', 'c'}), true)
        end)
    end)

    describe('_:isTruthy(var)', function()
        it('should return true if `var` is truthy otherwise false', function()
            assert.are.equals(_:isTruthy(nil), false)
            assert.are.equals(_:isTruthy(false), false)
            assert.are.equals(_:isTruthy('abc'), true)
            assert.are.equals(_:isTruthy(42), true)
            assert.are.equals(_:isTruthy(function() end), true)
        end)
    end)

    describe('_:isThread(var)', function()
        it('should return true if `var` is a thread, otherwise false', function()
            assert.are.equals(_:isThread('I am a thread!'), false)
            assert.are.equals(_:isThread(coroutine.create(function() end)), true)
        end)
    end)

end)