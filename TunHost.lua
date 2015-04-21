require "Host"	
require "IpPacket"
local iputils = require "iputils"

assert(iputils.newtun, "TUN support is not compiled in")

TunHost = Host:extend()

--
-- TunHost:new(ip, if_ip, subnet_mask)
-- [ by zyxwvu Shi, April 2015 ]
-- Make the host OS as an host in NetCraft.
--
function TunHost:initialize(ip, ...)
	self[1] = iputils.newtun()
	self[1]:bind(...)
	self.address = ip
	self[1].dstaddr = self.address
	self[1]:up()
end

function TunHost:_handle(packet)
	local serialized = IpPacket:check(packet):serialize()
	return self[1]:write(serialized)
end

