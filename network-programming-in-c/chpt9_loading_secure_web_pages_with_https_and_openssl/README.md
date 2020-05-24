# Chapter 9 - Loading Secure Web Pages with HTTPS and OpenSSL


```bin
gcc https_simple.c -o https_simple -lssl -lcrypto
./https_simple exmaple.com 443
```

Other example copied from book repository: 
- `tls_client.c`: This is `tcp_client.c` from *Chapter 3: An In-Depth Overview of TCP Connections*, but it has been modified to make TLS connections.
- `https_get.c`: This is the `web_get.c` program from *Chpater 6: Building a Simple Web Client*, but it has been modified for HTTPS. You can think of it as the extended version of `https_simple.c`.
- `tls_get_cert.c`: This is like `https_simple.c`, but it simply prints the connected server's certificate and exits.

### Questions

1. **What port does HTTPS typically operator on?**
* HTTPS connects over TCP port 443.

2. **How many keys does symmetric encryption use?**
* Symmetric encryption uses one key. Data is encrypted and decrypted with the same key.

3. **How many keys does asymmetric encryption use?**
* Asymmetric encryption uses two different, but mathematically related, keys. Data is encrypted with one and decrypted with the other.

4. **Does TLS use symmetric or asymmetric encryption?**
* TLS use both symmetric and asymmetric encyption algorithms to function.

5. **What is the difference between SSL and TLS?**
* TLS is the successor to SSL. SSL is now deprecated.

6. **What purpose do certificates fill?**
* Certificates allow a server or client to verify their identity.

