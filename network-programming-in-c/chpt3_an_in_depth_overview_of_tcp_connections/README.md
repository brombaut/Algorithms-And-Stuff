# Chapter 3 - An In-Depth Overview of TCP Connections

To make request to a web server, run `./tcp_client exmaple.com 80` and enter the following 3 lines (note the final blank line):
```
GET / HTTP/1/1
Host: exmaple.com

``` 

To use the *toupper* service, run `./tcp_server_toupper`, and then on a different terminal window run `./tcp_client 127.0.0.1 8080`. Send a message on the client, you should receive the message all uppercase as a reply.

To use the *chat* service, run `./tcp_server_chat`, and then on multiple different terminal window run `./tcp_client 127.0.0.1 8080`. Send a message on one of the client, you should receive the message on all other client windows.

### Questions

1. **How can we tell whether the next call to *recv()* will block?**
* We use the *select()* function to indicate which sockets are ready to be read from without blocking.

2. **How can you ensure that *select()* doesn't block for longer than a specified time?**
* You can pass *select()* a timeout parameter.

3. **When we used our *tcp_client* program to connect to a web server, why did we need to send a blank line before the web server responded?**
* HTTP, the wev server's protocol, expects a blank line to indicate the end of the request. Without this blank line, it wouldn't know if the client was going to keep sending additional request headers.

4. **Does *send()* ever block?**
* Yes. You can use *select()* to detemine when a socket is ready to be written to without blocking. Alternatively, sockets can be put into non-blocking mode.

5. **How can we tell whether the socket has been disconnected by our peer?**
* The return value of *recv()* can indicate if a socket has been disconnected.

6. **Is data received by *recv()* always the same size as data sent with *send()*?**
* No. TCP is a stream protocol. There is no way to tell if the data returned from one *recv()* call was sent with one or many calls to *send()*.

7. 
**Consider the following code:**
```c
recv(socket_peer, buffer, 4096, 0);
printf(buffer);
```
**What is wrong with it?**
**Also see what is wrong with this code:**
```c
recv(socket_peer, buffer, 4096, 0);
printf("%s", buffer);
```
* The data returned by *recv()* is not null terminated. Both of the preceding code excerpts will likely cause *printf()* to read past the end of the data returned by *recv()*. Additionally, in the first code example the data received could contain format specifiers (for example *%d*), which would cause additional memory access violations.
