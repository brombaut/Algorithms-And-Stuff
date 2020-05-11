# Chapter 2 - Getting to Grips with Socket APIs

### Questions

1. **What is a socket?**
* A socket is an abstraction that represents one endpoint of a communication link between systems.

2. **What is a connectionless protocol? What is a connection-oriented protocol?**
* A connection-oriented protocol sends data packets in the context of a larger stream of data. A connectionless protocol sends each packet of data independently of any before or after it.

3. **Is UDP a connectionless or connection-oriented protocol?**
* UDP os considered a connectionless protocol. Each emssage is sent independently of any before or after it.

4. **Is TCP a connectionless or connection-oriented protocol?**
* TCP is considered a connection-oriented protocol. Data is sent and recieved in order as a stream.

5. **What types of applications generally benefit from using the UDP protocol?**
* UDP applications benefit from better real-time performance while sacrificing reliability. They are also able to take advantage of IP multicasting.

6. **What types of applications generally benefit from using the TCP protocol?**
* Applications that need a reliable strean of data transfer ebefit from the TCP protocol.

7. **Does TCP guarentee that data will be transmitted successfully?**
* TCP makes some guarentees about reliability, but nothing can truly guarentee that data is transmitted successfully. For examplel, if someone unplugs your modem, no protocol can overcome that.

8. **What are some of the main differences between Berkeley sockets and Winsock sockets?**
* The header files are different. Sockets themselves are represented as signed versus unsigned *ints*. When *socket()* or *accept()* calls fail, the returned values are different. Berkley sockets are also standard file descriptions. This isn't always true with Winsocl. Error codes are different and retrieved in a different way. There are additional differences, but these are the main ones that affect our programs.

9. **What does the *bind()* function do?**
* The *bind()* function associates a socket with a particular local network address and port number. Its usage is almost always required for the server, and it's usually not required for the client.

10. **What does the *accept()* function do?**
* The *accept()* function will block until a new TCP client has connected. It then returns the socket for this new connection.

11. **In a TCP connection, does the client or the server send application data first?**
* Either the client or the server can send data first, They can even send data simultaneously. In practice, many client-server protocols (such as HTTP) work by having the client send a request first and then having the server send a response.