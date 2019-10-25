
# SMTP_MSA

SMTP MSA(STARTTLS) Scanner

## BLEICHENBACHER_VULNERABLE

### Headline

Check for Bleichenbacher vulnerability <span class="promarker"></span>

### Category

Attacks

### Description

The server is vulnerable to a [[Bleichenbacher-Vulnerability/EN|Bleichenbacher]] Attack. The communication can be decrypted and user inputs such as passwords can be read.

### Background

The so-called Bleichenbacher attack (also known as ROBOT) is a 19-year-old security hole that allows RSA decryption and signature operations to be performed with the private key of a TLS server. The attack is an error in the program code.

### Consequence

The server is vulnerable to a vulnerability that allows an attacker to decrypt the communication.

### Solution_Tips

If ''Vulnerability'' has been reported, immediately install an update to your TLS Implementation on your server.

### Link

Bleichenbacher-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[Bleichenbacher-Vulnerability/EN|Bleichenbacher]].

### Positive

Not vulnerable to [[Bleichenbacher-Vulnerability/EN|Bleichenbacher]].

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CERTIFICATE_EXPIRED

### Headline

Certificate verification Duration

### Category

Certificates

### Description

The message means that your server certificate has expired. Your website is displayed to visitors as insecure or untrustworthy. If a user visits your server via TLS, an error message may be displayed, e.g. "Your certificate expired on (date)".

### Background

Server Certificates provide more security on the Internet and serve to verify servers. A certificate is issued by official, trustworthy institutions and verifies the identity of the website. A certificate is not forgeable. In normal life, a certificate is comparable to an identity card or a notarial certification. Similar to a passport, certificates also have a certain validity period. Certificates thus ensure secure data exchange and form an important basis of trust for operators of e.g. online shops.

### Consequence

Most Internet browsers are configured so that by default you do not trust web pages with an expired certificate. A server with expired certificate thus generates a warning for each connection. A warning message during the communication of your server thus has a negative effect on your company presentation on the Internet.

### Solution_Tips

If ''Certificate expired'' has been reported, renew the [[Certificates|Certificate]] used. You can find out how to renew certificates here: [[Zertifikate#Was_tun.2C_wenn_ein_SSL-Zertifikat_abgelaufen_ist.3F|Certificate expired]] (German only).

### Link

Certificate-Expired-SMTP_MSA

### Negative

Certificate expired

### Positive

Certificate not expired

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CERTIFICATE_NOT_SENT_BY_SERVER

### Headline

Verification of certificate transmission

### Category

Certificates

### Description

The server has not sent any certificate. This is unusual and should not happen. The server should check its TLS configuration and disable [[Key-Exchange-Method/EN|anonymous cipher suites]] if necessary.

### Background

It is theoretically possible to configure a TLS server so that it does not send any certificate to identify itself and only encrypts it without signing its Public Key. A client who wants to connect to the server cannot check if he is really talking to the server he expects. This type of configuration is extremely rare.

### Consequence

Without certificate for your web pages, attackers can spy on your communication. Criminals could anonymously access your customers' personal data such as passwords.

### Solution_Tips

If ''Server does not send certificate'' was reported, update the TLS implementation you used urgently. Modern software no longer allows this type of configuration.

### Link

Certificate-Not-Sent-SMTP_MSA

### Negative

Server does not send a certificate

### Positive

Server send a certificate

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CERTIFICATE_NOT_VALID_YET

### Headline

Verification of certificate validity

### Category

Certificates

### Description

The message means that your server certificate is not yet valid. Your server is displayed to visitors as insecure or not trustworthy. If a user calls your server with TLS, an error message may be displayed.

### Background

Server certificates provide more security on the Internet and serve to verify (authenticity) the identity of servers. A certificate is issued by official, trustworthy institutions. A certificate is not forgeable. In normal life, a certificate is comparable to an identity card or a notarial certification. Similar to a passport, certificates also have a certain validity period. Certificates thus ensure secure data exchange and form an important basis of trust for operators, e.g. of online shops.

### Consequence

Most mail programs are configured so that by default they do not trust servers with expired certificate. A server with expired certificate thus generates a warning each time your server is called.

### Solution_Tips

If ''Certificate not yet valid'' was reported, use your old certificate as long as it is still valid. You can find out how to renew certificates here: [[Zertifikat-Abgelaufen/DE|Certificate expired]] (German only).

### Link

Certificate-Not-Valid-SMTP_MSA

### Negative

Certificate not yet valid

### Positive

Certificate is already valid

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CERTIFICATE_WEAK_HASH_FUNCTION

### Headline

Verification of the encryption strength of the certificate

### Category

Certificates

### Description

The message means that your server certificate has a weak hashing algorithm. This can potentially cause it to be falsified and is displayed as insecure in many mail programs.

### Background

Server certificates provide more security on the Internet and serve to verify (authenticity) the identity of servers. A certificate is issued by official, trustworthy institutions. A certificate is not forgeable. In normal life, a certificate is comparable to an identity card or a notarial certification. Similar to a passport, certificates also have a certain validity period. Certificates thus ensure secure data exchange and form an important basis of trust for operators, e.g. of online shops.

### Consequence

In the worst case, a weak hashing algorithm can cause attackers to create a fake certificate for your servers and impersonate your servers. This means that a server can impersonate another server. Criminals may be able to access your customers' personal data such as passwords or credit card information.

### Solution_Tips

If ''weak hash algorithm'' is reported, you should install a new certificate with a secure hash function. How to get a secure certificate you can read here: [[Zertifikate#Wie_wird_ein_SSL-Zertifikat_installiert.3F|Install_Certificate]] (German only).

### Link

Weak-Encryption-SMTP_MSA

### Negative

Weak hash algorithm

### Positive

Strong hash algorithm is used

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CIPHERSUITEORDER_ENFORCED

### Headline

Check for responsible selection of encryption algorithms

### Category

Cryptography

### Description

Your server is configured so that the encryption algorithms of the visitor are preferred to those of your server. Server should not leave the choice of encryption algorithms to your customers, but actively select strong connections.

### Background

Usually your server determines the encryption algorithms of the connection, not the other way around. Similar to the real world, you have house rules on your server - you define the rules, the guest has to follow them. You should not leave it to chance whether your connections are secure.

### Consequence

You leave it to the visitor of your server to decide how securely they communicate.

### Solution_Tips

If ''irresponsible selection of encryption algorithms'' has been reported, configure your web server so that your web server determines the encryption algorithms for communication between your server and the user's mail program.

### Link

Encryption-Algorithms-SMTP_MSA

### Negative

Irresponsible selection of encryption algorithms

### Positive

Responsible selection of encryption algorithms

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CIPHERSUITE_ANON

### Headline

Check for anonymous key exchange

### Category

Cryptography

### Description

Your web server/website is configured to allow connections without verifying the identity of your server.

### Background

The term Cipher Suite stands for a collection of cryptographic methods used (encryption of information). This collection includes the key exchange method, digital signature, encryption and cryptographic hash functions. This combination of cryptographic components ensures a secure connection between two parties, e.g. your mail program and a server. In the TLS protocol, the Cipher Suite (cryptographic procedure) determines which algorithms are to be used to establish a secure data connection and is decisively responsible for the security of the connection.

### Consequence

Your server is ready to establish very weak connections, which are vulnerable to Man-in-the-middle attacks. This can be used, for example, to read out passwords or credit card information and misuse them for criminal purposes.

### Solution_Tips

If ''Anonymous key exchange is supported'' is reported, disable "Anonymous key exchange" support in encryption methodology.

### Link

Key-Exchange-Method-SMTP_MSA

### Negative

Anonymous key exchange is supported

### Positive

Anonymous key exchange is not supported

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CIPHERSUITE_DES

### Headline

Check for DES encryption

### Category

Cryptography

### Description

Your web server/website is configured to support the encryption feature DES (Cipher Suites), which is now considered insecure. This allows Man-in-the-middle attacks.

### Background

The term Cipher Suite stands for a collection of cryptographic methods used (encryption of information). This collection includes the key exchange method, digital signature, encryption and cryptographic hash functions. This combination of cryptographic components ensures a secure connection between two parties, e.g. your mail program and a server. In the TLS protocol, the Cipher Suite (cryptographic procedure) determines which algorithms are to be used to establish a secure data connection and is decisively responsible for the security of the connection.

### Consequence

Attackers can use DES encryption to decrypt the communication between your website and your customer's browser, as DES does not offer sufficient security. This can be used, for example, to decrypt passwords, form data or credit card information and misuse them for criminal purposes.

### Solution_Tips

If ''Obsolete DES encryption supported'' was reported, disable support for DES Cipher Suites in your web server software.

### Link

Weak-DE-Encryption-SMTP_MSA

### Negative

Obsolete DES encryption supported

### Positive

No outdated DES encryption supported

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CIPHERSUITE_EXPORT

### Headline

Check for weak encryption functions

### Category

Cryptography

### Description

Your web server/website is configured to use intentionally insecure encryption methods. This allows you to decrypt communication with your server using Man-in-the-middle attacks.

### Background

The term Cipher Suite stands for a collection of cryptographic methods used (encryption of information). This collection includes the key exchange method, digital signature, encryption and cryptographic hash functions. This combination of cryptographic components ensures a secure connection between two parties, e.g. your mail program and a server. In the TLS protocol, the Cipher Suite (cryptographic procedure) determines which algorithms are to be used to establish a secure data connection and is decisively responsible for the security of the connection.

### Consequence

Attackers can easily decrypt the communication between your server and the mail program with a weak encryption methodology. This can be used, for example, to read out passwords, e-mails or credit card information and misuse them for criminal purposes.

### Solution_Tips

If ''Weak Export Encryption Supported'' is reported, disable support for EXPORT encryption methods in the web server.

### Link

Weakened-Encryption-SMTP_MSA

### Negative

Weak export encryption supported

### Positive

No weak export encryption supported

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CIPHERSUITE_NULL

### Headline

Check for NULL ciphers

### Category

Cryptography

### Description

Your server is configured to allow unencrypted communication over a protected channel. This allows man-in-the-middle attacks.

### Background

The term Cipher Suite stands for a collection of cryptographic methods used (encryption of information). This collection includes the key exchange method, digital signature, encryption and cryptographic hash functions. This combination of cryptographic components ensures a secure connection between two parties, e.g. your mail program and a server. In the TLS protocol, the Cipher Suite (cryptographic procedure) determines which algorithms are to be used to establish a secure data connection and is decisively responsible for the security of the connection.

### Consequence

Attackers can easily decrypt the communication between your server and the mail program with a weak encryption methodology. This can be used, for example, to read out passwords, e-mails or credit card information and misuse them for criminal purposes.

### Solution_Tips

If ''Insecure NULL ciphers supported'' was reported, disable support for NULL encryption methodology.

### Link

Unencrypted-Communication-SMTP_MSA

### Negative

Insecure NULL ciphers supported

### Positive

No insecure NULL ciphers supported

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CIPHERSUITE_RC4

### Headline

Check for RC4 encryption methodology

### Category

Cryptography

### Description

Your server is configured in such a way that the encryption function RC4, which is now considered insecure, is still supported. This weakens your connections and can lead to an attacker decrypting your data.

### Background

The term Cipher Suite stands for a collection of cryptographic methods used (encryption of information). This collection includes the key exchange method, digital signature, encryption and cryptographic hash functions. This combination of cryptographic components ensures a secure connection between two parties, e.g. your mail program and a server. In the TLS protocol, the Cipher Suite (cryptographic procedure) determines which algorithms are to be used to establish a secure data connection and is decisively responsible for the security of the connection.

The long-established encryption algorithm RC4 has been considered insecure for many years. Security researchers are aware of many critical gaps. In 2015, the IETF (Internet Engineering Task Force) banned the use of RC4 for TLS connections in [https://tools.ietf.org/html/rfc7465 RFC7465].

### Consequence

Attackers can use RC4 encryption to potentially decrypt the communication between your server and the mail program, since RC4 has known  vulnerabilities. This can be used, for example, to read passwords, e-mails or credit card information and misuse them for criminal purposes.

### Solution_Tips

If ''Obsolete RC4 encryption supported'' was reported, disable RC4 encryption support.

### Link

Unsecure-RC4-Encryption-SMTP_MSA

### Negative

Obsolete RC4 encryption supported

### Positive

No outdated RC4 encryption supported

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## CRIME_VULNERABLE

### Headline

CRIME vulnerability check

### Category

Attacks

### Description

The server is vulnerable to [[CRIME-Vulnerability/EN|CRIME]]. A vulnerability that allows an attacker to decrypt the communication.

### Background

The CRIME attack takes advantage of the fact that data compression can change the length of encrypted messages, and this provides conclusions about the plain text. This can be used by a skilled attacker to steal data.

### Consequence

The server is vulnerable to a vulnerability that allows an attacker to decrypt the communication.

### Solution_Tips

CRIME can be prevented by disabling the use of compression of data in TLS. Disable TLS compression on your server.

### Link

Crime-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[CRIME-Vulnerability/EN|CRIME]]

### Positive

Not vulnerable to [[CRIME-Vulnerability/EN|CRIME]]

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## EARLYCCS_VULNERABLE

### Headline

Check for Early CCS Vulnerability

### Category

Attacks

### Description

The server is vulnerable to the Early-CCS vulnerability. This vulnerability allows an attacker to decrypt communication and read user input such as passwords under special circumstances.

### Background

The Early CCS vulnerability is an implementation vulnerability in a 2014 TLS software library. If you are affected by this vulnerability, you should urgently update your software. The vulnerability is relatively minor, but a clear indicator that you have not updated your software for at least 5 years and are therefore affected by more serious attacks.

### Consequence

The server is vulnerable to a vulnerability that allows an attacker to decrypt the communication in special situations. The software used is obsolete.

### Solution_Tips

If vulnerability has been reported, immediately install an update to your TLS implementation on your server.

### Link

Early-CCS-Vulnerability-SMTP_MSA

### Negative

Vulnerable to Early CCS vulnerability.

### Positive

Not vulnerable to Early CCS vulnerability.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## HEARTBLEED_VULNERABLE

### Headline

Check for Heartbleed Vulnerability <span class="promarker"></span>

### Category

Attacks

### Description

The server is vulnerable to heartbleed. This allows an attacker to read sensitive data from the server's memory, such as secret keys and e-mails.

### Background

Heartbleed is described as the most serious security vulnerability of all time and has existed since 2011. The vulnerability exists in a software called OpenSSL, which is designed to protect the communication of data on the Internet via the TLS security protocol. The gap in OpenSSL has already been closed for several years.

### Consequence

The server is vulnerable to an implementation vulnerability that allows an attacker to attack your server.

### Solution_Tips

In case of vulnerability, immediately install an update for your TLS implementation on your server.

### Link

Heartbleed-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[Heartbleed-Vulnerability/EN|Heartbleed]]

### Positive

Not vulnerable to [[Heartbleed-Vulnerability/EN|Heartbleed]]

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## HTTPS_NOT_SUPPORTED

### Headline

Checking for TLS support

### Category

Information

### Description

The server does not seem to support TLS (Transport Layer Security). This means that you do not use any encryption to protect your data and that of your customers.

### Background

The server ":HOST" does not seem to support TLS (Transport Layer Security). This means that you do not use any encryption to protect your data and that of your customers.

### Consequence

Anyone can read your data or manipulate the contents of your server during transmission.

### Solution_Tips

If ''Server does not seem to support TLS'' is reported, enable TLS (Transport Layer Security).

### Link

No-TLS-Support-SMTP_MSA

### Negative

Server does not seem to support TLS.

### Positive

Server supports TLS.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## HTTPS_NO_RESPONSE

### Headline

Checking for TLS support

### Category

Information

### Description

The server doesn't seem to be responding at all. Did you enter the domain correctly?

### Background

The server doesn't seem to be responding. Did you enter the domain correctly?

### Consequence

The website could not be reached.

### Solution_Tips

If the server does not respond, please check your input for input errors.

### Link

Response-Time-Exceeded-SMTP_MSA

### Negative

Server does not respond.

### Positive

Server respond.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## INVALID_CURVE_EPHEMERAL_VULNERABLE

### Headline

Check for Ephemeral Invalid Curve Vulnerability <span class="promarker"></span>

### Category

Attacks

### Description

The server is vulnerable to a [[Invalid-Curve-Ephemeral-Vulnerability/EN|Ephemeral Invalid Curve Attack]]. This allows an attacker to attack the connections.

### Background

Elliptic Curve Cryptography (ECC) is one of the cornerstones of modern cryptography due to its security and performance features. It is used in key exchange protocols as well as for the calculation of signatures. However, fatal security holes can occur if it is used incorrectly.

### Consequence

The server is vulnerable to an implementation vulnerability that allows an attacker to decrypt the communication.

### Solution_Tips

If vulnerability has been reported, immediately install an update to your TLS implementation on your server.

### Link

Invalid-Curve-Eephemeral-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[Invalid Curve Ephemeral Vulnerability/EN|Ephemeral Invalid Curve]] attacks.

### Positive

Not vulnerable to [[Invalid Curve Ephemeral Vulnerability/EN|Ephemeral Invalid Curve]] attacks.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## INVALID_CURVE_VULNERABLE

### Headline

Check for Invalid Curve Vulnerability <span class="promarker"></span>

### Category

Attacks

### Description

The server is vulnerable to an Invalid Curve attack. This allows an attacker to steal the secret key of your certificate. After that, all your future connections will also be compromised, as well as parts of your past communication.

### Background

For cryptographic encryption, elliptical curves must be selected very carefully, since keys are created from certain curve points, which is not so easy.

### Consequence

The server is vulnerable to an implementation vulnerability that allows an attacker to decrypt the communication and steal the private key of your certificate.

### Solution_Tips

If vulnerabilities have been reported, immediately install an update to your TLS implementation on your server.  You should also replace your certificate, as it may already have been compromised.

### Link

Invalid-Curve-Vulnerabilty-SMTP_MSA

### Negative

Vulnerable to [[Invalid Curve Vulnerability/EN|Invalid Curve Attacks]].

### Positive

Not vulnerable to [[Invalid Curve Vulnerability/EN|Invalid Curve Attacks]].

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## PADDING_ORACLE_VULNERABLE

### Headline

Check for Padding Oracle Vulnerability <span class="promarker"></span>

### Category

Attacks

### Description

The server is vulnerable to a Padding-Oracle attack, which allows an attacker to decrypt the communication.

### Background

The [[Padding-Oracle-Vulnerability/EN|Padding-Oracle Attack]] can be used by attackers to attack secured connections. It establishes a connection to the server and sends very specially prepared encrypted messages. These messages are almost correctly encrypted, but have errors in critical positions. A server that receives such a message must always '''reject these messages in the same way'''. An attacker evaluates the error messages sent and can use this information to partially decrypt the connection to the server, making the connection insecure.

### Consequence

The server is vulnerable to an implementation vulnerability that allows an attacker to decrypt the communication.

### Solution_Tips

If vulnerability has been reported, immediately install an update for your TLS implementation on your server.

### Link

PADDING-ORACLE-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[Padding-Oracle-Vulnerability/EN|Padding Oracle Attacks]].

### Positive

Not vulnerable to [[Padding-Oracle-Vulnerability/EN|Padding Oracle Attacks]].

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## POODLE_VULNERABLE

### Headline

Check for POODLE vulnerability

### Category

Attacks

### Description

The server is vulnerable to a POODLE attack, which potentially allows an attacker to decrypt the communication.

### Background

POODLE (Padding Oracle On Downgraded Legacy Encryption) is a serious security vulnerability in various Internet protocols that allows private data to be read from clients and servers via encrypted connections.

### Consequence

The server is vulnerable to a vulnerability that allows an attacker to decrypt the communication.

### Solution_Tips

If vulnerability has been reported, immediately disable the outdated SSL3 encryption protocol on your server!

### Link

POODLE-Vulnerability-SMTP_MSA

### Negative

Vulnerable to POODLE

### Positive

Not vulnerable to POODLE

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## PROTOCOLVERSION_SSL2

### Headline

Check for outdated SSL2 protocol

### Category

Cryptography

### Description

The server supports the outdated protocol version SSL2, which is considered highly insecure. By using this version, you massively endanger the security of the entire server and possibly your entire corporate network.

### Background

SSL (Secure Sockets Layer) stands for a hybrid (combined) encryption protocol for secure data transmission on the Internet and serves as the basis for secure access via HTTPS. The SSL2 version dates back to 1994 and has not been officially supported since 2011. The term SSL has since been replaced by the term TLS (Transport Layer Security). For example, the SSL2 gap serves as a gateway for a DROWN attack, which allows criminals to read the entire data traffic of your website.

### Consequence

SSL2 is no longer supported by almost all mail programs, but still leads to fatal security problems on your server. SSL2 is one of the oldest components of the Internet and must be switched off immediately.

### Solution_Tips

If ''Outdated protocol version SSL2 is supported'' was reported: TLS encryption is now the default. You should therefore refrain from using SSL2. 

### Link

Obsolete-Protocol-Version-SSL2-SMTP_MSA

### Negative

Obsolete protocol version SSL2 is supported.

### Positive

Obsolete protocol version SSL2 is not supported.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## PROTOCOLVERSION_SSL3

### Headline

Check for outdated SSL3 protocol

### Category

Cryptography

### Description

The server supports the outdated SSL3 protocol version, which is considered highly insecure. By using this version you massively endanger the security of the connections to this server.

### Background

SSL (Secure Sockets Layer) stands for a hybrid encryption protocol for secure data transmission on the Internet and serves as the basis for secure calling via TLS. The SSL3 version dates from 1995 and has not been officially supported since 2015. The term SSL has since been replaced by the term TLS (Transport Layer Security). The SSL3 gap became particularly known through POODLE. By using SSL3, the confidentiality of the connections can no longer be guaranteed.

### Consequence

By offering SSL3 on the server side, you allow attacks on connections with older clients. This allows an attacker to potentially decrypt parts of the connection and steal data.

### Solution_Tips

If ''Outdated protocol version SSL3 is supported'' is reported: TLS encryption is now the default. You should therefore refrain from using SSL3. 

### Link

Obsolete-Protocol-Version-SSL3-SMTP_MSA

### Negative

Obsolete protocol version SSL3 is supported.

### Positive

Obsolete protocol version SSL3 is not supported.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## PROTOCOLVERSION_TLS13

### Headline

ÜChecking for use of TLS 1.3 protocol

### Category

Cryptography

### Description

The server supports the latest TLS protocol version 1.3.

### Background

TLS 1.3 is the latest version of TLS. It is faster and better.

### Consequence

TLS 1.3 is not supported by any Internet browser in its default configuration, so you will not win/loss customers if you do not support this version.

### Solution_Tips

There is no need for action.

### Link

Protocol-Version-TLS13-Found-SMTP_MSA

### Negative

Modern TLS 1.3 protocol is supported.

### Positive

TLS 1.3 protocol is not supported.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## SWEET32_VULNERABLE

### Headline

Scan for Sweet32 vulnerability

### Category

Attacks

### Description

The server is vulnerable to Sweet32, which allows an attacker under certain circumstances to decrypt parts of the communication if large amounts of data are transferred over a connection.

### Background

The attack exploits 64-bit block ciphers. The Sweet32 attack allows an attacker, under certain circumstances, to recover small pieces of text when encrypted with 64-bit block ciphers (such as 3DES). The attack is not very easy to perform, so the threat is limited.

### Consequence

The server is vulnerable to SWEET32, which allows an attacker to decrypt the communication.

### Solution_Tips

Wherever possible, it is best not to use triple DES. Deactivate block ciphers with a block length of 64 bits.

### Link

Sweet32-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[Sweet32-Vulnerability/EN|Sweet32]].

### Positive

Not vulnerable to [[Sweet32-Vulnerability/EN|Sweet32]].

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## TLS_POODLE_VULNERABLE

### Headline

Check for TLS-POODLE vulnerability

### Category

Attacks

### Description

The server is vulnerable to a variant of the Poodle attack on TLS, which allows an attacker to decrypt the communication.

### Background

There is a variant of the POODLE attack which also attacks newer TLS versions. This is possible due to an implementation error in the TLS servers.

### Consequence

The server is vulnerable to a vulnerability that allows an attacker to decrypt the communication.

### Solution_Tips

If vulnerability has been reported, immediately install an update to your TLS implementation on your server.

### Link

TLS-POODLE-Vulnerability-SMTP_MSA

### Negative

Vulnerable to [[TLS-POODLE-Vulnerability/EN|TLS-POODLE]].

### Positive

Not vulnerable to [[TLS-POODLE-Vulnerability/EN|TLS-POODLE]].

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## _RESULTS

### ANON_SUITES

Your server is configured to use an anonymous encryption method without authentication on connection. This allows man-in-the-middle attacks.

### CERTIFICATE_WEAK_SIGN_ALGO

Verification of the certificate signature algorithms

### CERTIFICATE_WEAK_SIGN_ALGO_SUCCESS

Checking the certificate hash algorithms

### DES_SUITES

Your server is configured to support the DES (Cipher Suites) encryption feature, which is now considered insecure. This enables man-in-the-middle attacks.

### EXPIRED

Your certificate expired on :DATE. Your website is displayed to visitors as insecure or untrustworthy.

### EXPORT_SUITES

Your web server/website is configured to use intentionally weakened cryptographic functions (cipher suites). This enables man-in-the-middle attacks.

### HASH_ALGO

Your server certificate uses the weak hash algorithm :HASH. This makes it very easy to forge the certificate. However, a weak hash algorithm does not necessarily result in a warning when your server is called.

### HTTPS_RESPONSE

The ":HOST" server does not respond to TLS requests.

### HTTPS_SUPPORTED

The server ":HOST" does not seem to support TLS. This means that you do not use any encryption to protect your data.

### NOT_YET_VALID

Your certificate will only be valid on :DATE. Until then, your server will be displayed to visitors as insecure or not trustworthy.

### NULL_SUITES

Your server is configured to allow unencrypted data transmission over a protected channel. This allows man-in-the-middle attacks.

### PORT_NO_RESPONSE

No response from the server.

### RC4_SUITES

Your server is configured to continue supporting the RC4 encryption feature, which is now considered insecure. This allows man-in-the-middle attacks.

### REPORT_CONSTRUCTION

An internal error occurred.

### TLS_NOT_SUPPORTED

TLS is not supported.