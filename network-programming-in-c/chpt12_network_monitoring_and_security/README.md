# Chapter 12 - Network Monitoring And Security

No coding in this chapter.

### Questions

1. **Which tool would you use to test the reachability of a target system?**
* The `ping` tool is useful to test reachability.

2. **Which tool lists the routers to a destination system?**
* The `traceroute` (`tracert` on Windows) tool will show the network path to a target system.

3. **What are raw sockets used for?**
* Raw sockets allow the programmer to specify directly what goes into a network packet. They provide lower-level access than TCP and UDP sockets, and can be used to implement additional protocols, such as ECMP.

4. **Which tools list the open TCP sockets on your system?**
* The `netstat` tool can be used to show open connections on your local system.

5. **What is one of the biggest concerns with security for networked C programs?**
* When programming networked applications in C, special care must be given to memoru safety. Even a small mistake could allow an attacker to compromise your program.
