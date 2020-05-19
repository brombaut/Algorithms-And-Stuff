# Chapter 5 - Hostname Resolution and DNS

`./lookup benrombaut.ca`

`./dns_query benrombaut.ca a|aaaa|mx|txt|any`


### Questions

1. **Which function fills in an address needed for socket programming in a portable and protocol-independent way?**
* `getaddrinfo()` is the function to use for this.

2. **Which socket programming function can be used to convert an IP address back into a name?**
* `getnameinfo()` can be uses to convert addresses back to names.

3. **A DNS query converts a name into an address, and a reverse DNS query converts an address back into a name. If you run a DNS query on a nname, and then a reverse DNS query on the resulting address, do you always get back the name you started with?**
* Sometimes, you will get the same name back but not always. This is because the forward and reverse lookups use independent records. It's also possible to have many names point to one address, but that one address can only have one record that points back to a single name.

4. **What are the DNS records types used to return IPv4 and IPv6 addresses for a name?**
* The *A* record type returns an IPv4 address, and the *AAAA* record type returns an IPv6 address.

5. **Which DNS record type stores special information about email servers?**
* The *MX* record tyoe used to return email server information.

6. **Does *getaddrinfo()* alwaysreturn immediately? Or can it block?**
* If `getaddrinfo()` is doing name lookups, it will often block. In the worst-case scenario, many UDP messages would need to be sent to various DNS servers, so this can be a noticeable delay. This is one reason why DNS caching is important.  
If you are simply using `getaddrinfo()` to convert from a text IP address, then it shouldn't block.

7. **What happens when a DNS response is too large to fit into a single UDP packet?**
* The DNS response will have the *TC* bit set in its header. This indicates that the messages was truncated. The query should be resent using TCP.