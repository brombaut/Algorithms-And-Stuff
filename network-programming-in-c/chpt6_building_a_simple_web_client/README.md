# Chapter 6 - Building a Simple Web Server (HTTP)

Note that for the web_get program to be usccessful, the site must accept HTTP (not require HTTPS).

```bash
./web_get exmaple.com
URL: exmaple.com:80
hostname: exmaple.com
port: 80
path: 
Configuring remote address...
Remote address is: 104.18.145.11 http
Creating socket...
Connecting...
Connected.

Sent Headers:
GET / HTTP/1.1
Host: exmaple.com:80
Connection: close
User-Agent: honpwc web_get 1.0

Received Headers:
HTTP/1.1 200 OK
Date: Tue, 19 May 2020 23:23:13 GMT
Content-Type: text/html
Transfer-Encoding: chunked
Connection: close
Set-Cookie: __cfduid=d933e492ebe7da6ef5122acf110e6ebd61589930593; expires=Thu, 18-Jun-20 23:23:13 GMT; path=/; domain=.exmaple.com; HttpOnly; SameSite=Lax
X-GUploader-UploadID: AEnB2UpEWG3GdkdoJNAp9iYRBVerF0UXv2_6_f_ujWpFjTU9IZG6YGS9y9wh7c-whqmqBfkdaUUV-uGH_kzJx_eGpTJ0X6v9FA
Expires: Wed, 20 May 2020 03:23:13 GMT
Last-Modified: Mon, 02 Dec 2019 21:19:34 GMT
x-goog-generation: 1575321574021563
x-goog-metageneration: 1
x-goog-stored-content-encoding: identity
x-goog-stored-content-length: 126
x-goog-hash: crc32c=UlfwlA==
x-goog-hash: md5=iuwbVeu20dm7Ka83Y/eHSg==
x-goog-storage-class: STANDARD
Cache-Control: public, max-age=14400
Age: 10719
CF-Cache-Status: HIT
Accept-Ranges: bytes
Server: cloudflare
CF-RAY: 59619083cf0ee708-EWR
cf-request-id: 02d0d8a65c0000e7082e97d200000001

Received Body:
<h1>Well hello there.</h1>
<p>
  Welcome to exmaple.com.<br>
  Chances are you got here by mistake (example.com, anyone?)
</p>
Closing socket...
Finished.

```



### Questions

1. **Does HTTP use TCP or UDP?**
* HTTP runs over TCP port 80.

2. **What type of resources can be sent over HTTP?**
* HTTP can be used to transfer essentually any computer file. It's commonly used for wep pages (HTML) and the associated files (such as styles, scripts, fonts, and images).

3. **What are the common HTTP request types?**
* `GET`, `POST`, and `HEAD` are the most common HTTP request types.

4. **What HTTP request type is typically used to send data from the server to the client?**
* `GET` is the usual request type for a client to request a resource from the server.

5. **What HTTP request type si typically used to send data from the client to the server?**
* `POST` is used when the client needs to send data to the server.

6. **What are the two common methods used to determine an HTTP response body length?**
* The HTTP body length is commonly determined by the `Content-Length` header or by using `Transfer-Encoding: chunked`.

7. **How is the HTTP request formatted for a `POST`-type HTTP request?**
* This is determined by the application. The client should set the `Content-Type` header to specify which format it is using. `application/x-www-form-urlencoded` and `application/json` are common values. Also see `Content-Type: multipart/form-data; boundary=-----------2331211957Yadayadayada`
