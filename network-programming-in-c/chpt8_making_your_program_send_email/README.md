# Chapter 8 - Making Your Program Send Email (SMTP)

### Questions

1. **What port does SMTP operate on?**
* SMTP does mail transmission over TCP port 25. Many providers use alternative ports for mail submission.

2. **How do you determine which SMTP server receives mail for a given domain?**
* The mail servers responsible for receiing mail for a given domain are given by MX-type DNS records.

3. **How do you determine which SMTP server sends mail for a given provider?**
* It's not possible to determine that in the general case. In any case, several servers could be responsible. Sometimes these servers will be listed under a TXT-type DNS record using SPF, but that is certainly not universal.

4. **Why won't an SMTP server relay mail without authentication?**
* Open relay SMTP servers are targeted by spammers. SMTP servers require authentication to prevent abuse.

5. **How are binary files sent as email attachments when SMTP is a text-based protocol?**
* Binary files must be re-encoded as plain text. The most common method is with `Content-Transfer-Encoding: base64`.

