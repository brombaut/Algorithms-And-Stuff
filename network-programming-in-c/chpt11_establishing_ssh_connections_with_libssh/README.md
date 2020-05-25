# Chapter 11 - Establishing SSH Connections with libssh

Most of these code examples have been copied from the book repo.

### Questions

1. **What is the significant downside of using Telnet?**
* Essentially, Telnet provides no security features. Passwords are sent as plaintext.

2. **Which port does SSH typicallu run on?**
* SSH's official port is TCP port 22. In practice, it is common to run SSH on arbitrary ports in an attempt to hide from attackers. With a properly secured server, these attackers are a nuisance rather than a legitimate threat.

3. **Why is it essential that the client authenticates the SSH server?**
* If the client doesn't verify the SSH server's identify, then it could be tricked into sending credentials to an imposter.

4. **How is the server typically authenticated?**
* SSH servers typically use certificates to identify themselves. This is similar to how servers are authenticated when using HTTPS.

5. **How is the SSH client typically authenticated?**
* It is still common for clients to authenticate with a password. The downside to this method is that if a client is somehow tricked into connecting to an impostor server, then their password will be compromised. SSH provides alternate methods, including authenticating clients using certificates, that aren't susceptible to replay attacks.