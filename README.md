# NetCraft

NetCraft is a set of networking devices abstracted as LuaObjects classes. It is useful for exploring or testing network structures with a few lines of code. I made this to explore the packet-switching system.

NetCraft covers the IP network layer of a protocol stack. The Ethernet layer is not covered but the MTU limit will still be concerned.

## Abstracted Devices

### Hosts

Hosts are just like the computers attached to a network. It could be an class with a TCP stack implement inside it, and you could put your services written in Lua running on it. It could also be your host OS connected via a TUN device.

I'm considering redirecting socket calls of another process to a host with a complete IP stack implemented in the Lua VM, then it would just look like that the program is running inside the virtual host. But this would be a huge project and I need to learn a lot about LD before working on it.

### Hubs

Hubs are used to connect hosts together. Switch is inherited from it but they won't dispatch packets to any other hosts. They could learn the IPs of hosts.

### Routers

Routers can have a logic to determine which hub a packet should be dispatched to. I will implement one based on static route tables.

Note that routers have many routes, but Route is inherited from Host, so a router could be attached to many hubs. Routes will redirect the packets to it to its router.

### Firewalls

Firewalls can be used to wrap a host or another firewall (since Firewall is inherited from Host). They are devices that could drop or emit packets according to their logic.

GFW is a special kind of firewall and I need help implementing it. If anyone could help I will implement it.

## API design

Each kind of device will have the same API design. I will fill this section later.
