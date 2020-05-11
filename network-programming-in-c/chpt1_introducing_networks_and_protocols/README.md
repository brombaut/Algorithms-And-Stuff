# Chapter 1 - Introducing Networks and Protocols

### Questions

1. **What are the key differences between IPv4 and IPv6?**
* IPv4 only supports 4 billion unique addresses, and because they were allocated inefficiently, we are now running out. IPv6 supports 3.4x10^38 possible addresses. IPv6 provides many other improvements, but this is the one that affects our ntwork programming directly.

2. **Are the IP addresses given by the ipconfig and ifconfig commands the same IP addresses that a remote web server sees if you connect to it?**
* Sometimes, these addresses will match, but not always. If you're on a private IPv4 network, then your router likely performs network address translation. The remote web server then sees the translated address. If you have a publicly routable IPv4 or IPv6 address, then the address seen by the remote web server will match those reported by ipconfig and ifconfig.

3. **What is the IPv4 loopback address?**
* 127.0.0.1, and it allows networked programs to communicate with each other while executing on the same machine.

4. **What is the UPv6 loopback address?**
* ::1

5. **How are domain names (for example, example.com) resolved into IP addresses?**
* DNS is used to resolve domain names into IP addresses.

6. **How can you find your public IP address?**
* Easiest way is to visit a website that reports it for you.

7. **How does an operating system know which application is responsible for an incoming packet?**
* Each IP packet has a local address, remote address, local port number, remote port number, and protocol type. These five attributes are memorized by the operating system to determine which application should handle any given incoming packet.