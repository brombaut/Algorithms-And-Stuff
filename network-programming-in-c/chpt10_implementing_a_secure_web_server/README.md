# Chapter 10 - Implementing A Secure Web Server

Generate a certificate
```bash
openssl req -x509 -newkey rsa:2048 -nodes -sha256 -keyout key.pem -out cert.pem -days 365
```

View Certificate
```bash
openssl x509 -text -noout -in cert.pem
```

Compile time server program and navigate to https://127.0.0.1:8080
```bash
gcc tls_time_server.c -o tls_time_server -lssl -lcrypto
```

Other example copied from book repository: 
- `https_server.c`: This is a modification of `web_server.c` from *Chapter 7: Building A Simple Web Server*. It can be used to serve a simple static website over HTTPS.

### Questions

1. **How can a client decide whether it should trust a server's certificate?**
* There are various ways a client can trust a server's certificate. The chain-of-trust model is the most common. In this model, the client explicitly trusts an authority. The client then implicitly trusts any certificates it encounters that are signed by this trusted authority.

2. **What is the main issue with self-signed certificates?**
* Self-signed certificates aren't signed by a trusted certificate authority. Web browsers won't know to trust self-signed certificates unless the user adds a special exception.

3. **What can cause `SSL_accept()` to fail?**
* `SSL_accept()` fails if the client doesn't trust the server's certificate or if the client and server can't agree on a mutually supported protocol version and cipher suite.

4. **Can `select()` be used to multiplex connections for HTTPS servers?**
* Yes, but be aware that `select()` works on the underlying TCP connection layer, not on the TLS layer. Therefor, when `select()` indicates that a socket has data waiting, it does not necessarily mean that there is new TLS data ready.