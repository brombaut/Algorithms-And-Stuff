# Chapter 4 - Establishing UDP Connections

*sendto* and *recvfrom* show how UDP connections are handled. Notice that you can execute *sendto* while *recvfrom* isn't running and it will still send.

To use the *toupper* service, run `./udp_server_toupper`, and then on a different terminal window run `./udp_client 127.0.0.1 8080`. Send a message on the client, you should receive the message all uppercase as a reply.


### Questions

1. **How do *sento()* and *recvfrom()* differ from *send()* and *recv()*?**
* The *send()* and *recv()* functions are useful after calling *connect()*. They only work with the one remote address that was passed to *connect()*. The *sendto()* and *recvfrom()* functions can be used with multiple remote addresses.

2. **Can *send()* and *recv()* be used on UDP sockets?**
* Yes. The *connect()* function should be called first in that case. However, the *sendto()* and *recvfrom()* functions are often more useful for UDP sockets.

3. **What does *connect()* do in the case of a UDP socket?**
* The *connect()* function associates the socket wuth a remote address.

4. **What makes multiplexing with UDP easier than with TCP?**
* One UDP socket can talk to multiple remote peers. For TCP, one socket is needed for each peer.

5. **What are the downsides to UDP when compared to TCP?**
* UDP does not attempt to fix many of the errors that TCP does. For example, TCP ensures that data arrives in the same order it was sent. TCP tries to avoid causing network congestion, and TCP attempts to resend lost packets. UDP does none of this. 

6. **Can the same program use UDP and TCP?**
* Yes. It just needs to create sockets for both.
