----------------------
--------------------
-- Event Functions
----------------
--------------
------------
----------
--------
------
----
--

------------------
-- Public Functions
--------
------
----
--

-- _:on(name, func)
-- Register one or more event listener.
--
-- @param  string(name)
-- @param  function(...)
-- @return void
function _:on(name, ...)
    name = _:assertArgument('name', name, 'string')
    --func = _:assertArgument('func', func, 'function')
    ---
    table.foreach({...}, function(k, v)
        if type(v) == 'function' then
            if not _.E[name] then
                _.E[name] = { v }
            else
                table.insert(_.E[name], v)
            end
        end
    end)
end

-- _:off(name)
-- Unregisters existing event listener.
--
-- Warning:
--  All listeners registered with this name
--  will be unregistered.
--
-- @param  string(...)
-- @return void
function _:off(...)
    table.foreach({...}, function(k, v)
        if type(v) == 'string' then
            _.E[v] = nil
        end
    end)
end

-- _:dipatch(name, ...)
-- Dispatches all events with matching name.
--
-- @param  string(name)
-- @param  mixed(...)
-- @return void
function _:dispatch(name, ...)
    name = _:assertArgument('name', name, 'string')
    ---
    for k, func in pairs(_.E[name] or {}) do
        func(...)
    end
end