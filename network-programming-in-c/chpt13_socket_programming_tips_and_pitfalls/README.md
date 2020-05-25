# Chapter 13 - Socket Programming Tips and Pitfalls

All code exmaples have been copied from book repo.

### Questions

1. **Is it ever acceptable just to terminate a program if a network error is detected?**
* Yes. For some applications terminating on error is the right call. For more substantial applications, the ability to retry and continue on may be needed.

2. **Which system functions are used to convert error codes into text descriptions?**
* You can use `FormatMessage()` on Windows and `strerror()` on other platforms to obtain error messages.

3. **How long does it take for a call to `connect()` to complete on a TCP socket?**
* A call to `connect()` typically blocks for at least one network time round trip while the TCP three-way handshake is being completed.

4. **What happens if you call `send()` on a disconnected TCP socket?**
* On Unix-based systems, your program can receive a `SIGPIP` signal. It is important to plan for that. Otherwise, `send()` returns `-1`.

5. **How can you ensure that the next call ti `send()` won't block?**
* Either use `select()` to make sure the oscket is ready for more data or use non-blocking sockets.

6. **What happens if both peers to a TCP connection try to send a large amount of data simultaneously?**
* If both sides to a TCP connection are calling `send()`, but not `recv()`, then they can be trapped in a deadlocked state. It is important to intersperse calls to `send()` with calls to `recv()`. The use of `select()` can help inform your program about what to do next.

7. **Can you improve the application performance by disabling the Nagle algorithm.**
* It depends on what your application is doing. For real-time applications using TCP, disabling the Nagle algorithm is often a good trade-off for decreasing latency at the expense of bandwidth efficiency. For other applications, disabling it can decrease throughput, increase network congestion, and even increase latency.

8. **How many connections can `select()` handle?**
* It depends on your platform. It is defined in the `FD_SETSIZE` macro, which is easily increased on Windows but not on other platforms. Typically, the upper limit is around 1024 sockets.