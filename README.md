# Test an email against default SpamAssassin

## Build

```
$ docker build . -t spamtest
```

## test

Write an email with headers at `email.txt`.

```
$ cat email.txt | docker run -i spamtest

...
Content analysis details:   (3.4 points, 5.0 required)

 pts rule name              description
---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                            blocked.  See
                            http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                             for more information.
                            [URIs: outsystems.com]
 1.0 URI_TRY_3LD            URI: "Try it" URI, suspicious hostname
 0.0 HTML_MESSAGE           BODY: HTML included in message
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                            valid
 1.1 SUBJ_ILLEGAL_CHARS     Subject: has too many raw illegal characters
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 0.1 SUBJECT_NEEDS_ENCODING Subject is encoded but does not specify
                            the encoding
 1.0 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
```
