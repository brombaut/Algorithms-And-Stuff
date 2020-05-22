# Chapter 7 - Building a Simple Web Server (HTTP)


Run `web_server` and navigate to `127.0.0.1:8080` in a web browser.


### Questions

1. **How does an HTTP client indicate that it has finished sending the HTTP request?**
* The HTTP request should end with a blank line.

2. **How does an HTTP client know what type of content the HTTP server is sending?**
* The HTTP server should identify the content with a `Content-Type` header.

3. **How can an HTTP server identify a file's media type?**
* A common method of identifying a file's media type is just to look at the file extension. The server is free to use other methods though. When sending dynamic pages or data from a database, there will be no file and therefore no file extension. In this case, the server must know the media type from its context.

4. **How can you tell whether a file exists on the filesystem and is readable by your program? Is `fopen(filename, "r") != 0` a good test?**
* This is not a trivial problem. A robust program will nedd to consider system specific APIs carefully. Windows uses special filenames that will trip up a program that relies only on `fopen()` to check for a file's existence.
