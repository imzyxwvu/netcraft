require "Host"
require "Router"
require "Hub"

Route = Host:extend()

local band = (bit or bit32).band

--
-- Route:new(router)
-- [ by zyxwvu Shi, April 2015 ]
-- A route binds to a router and should be attached
-- to a hub later.
--
function Route:initialize(router)
	Router:Check(router):append(self)
end

--
-- Route:match(subnet, mask)
-- [ by zyxwvu Shi, April 2015 ]
-- Add an route rule. It works like an entry
-- in a static route table.
--
function Route:match(subnet, mask)
	assert(subnet and mask, "no enough argument")
	local entry = { band(subnet, mask), mask }
	self[#self + 1] = entry
end
