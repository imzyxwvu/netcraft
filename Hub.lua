Hub = (require "Object"):extend()
require "Host"
require "IpPacket"

--
-- for device in Hub:each()
-- [ by zyxwvu Shi, April 2015 ]
-- Return an iterator to iterate each device attached to the hub.
--
function Hub:each()
	local i = 0
	return function()
		i = i + 1
		return self[i]
	end
end

--
-- Hub:attach(device)
-- [ by zyxwvu Shi, April 2015 ]
-- Attach a device onto the hub. One hub has many devices.
--
function Hub:attach(device)
	Host:check(device)
	if device.attached_to == self then return end
	assert(device.attached_to == nil,
	       "device is attached to another hub")
	self[#self + 1] = device
end

--
-- Hub:dispatch(packet)
-- [ by zyxwvu Shi, April 2015 ]
-- Deliver the packet to each device attached to the hub.
--
function Hub:dispatch(packet)
	IpPacket:check(packet)
	for device in self:each() do
		device:_handle(packet)
	end
end
