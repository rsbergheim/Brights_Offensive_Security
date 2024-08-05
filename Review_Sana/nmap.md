Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-08-05 14:02 CEST
Nmap scan report for demo.owasp-juice.shop (81.169.145.156)
Host is up (0.086s latency).
Other addresses for demo.owasp-juice.shop (not scanned): 2a01:238:20a:202:1156::
rDNS record for 81.169.145.156: w9c.rzone.de
Not shown: 65529 closed tcp ports (conn-refused)
PORT     STATE SERVICE    VERSION
21/tcp   open  ftp        ftpd.bin round-robin file server 3.4.0r16
| ftp-syst:
|   STAT:
| Server status:
|     Transfer mode: ASCII
|     List mode:     UNIX
|     Current number of users: 456
|     Maximum number of users: 8364
|     Idle timeout: 300 seconds
|     Hostname: zizzi
|_End of server status.
80/tcp   open  http-proxy F5 BIG-IP load balancer http proxy
| http-server-header:
|   BigIP
|_  Cowboy
443/tcp  open  ssl/http   Apache httpd 2.4.62 ((Unix))
|_http-title: OWASP Juice Shop
| ssl-cert: Subject: commonName=*.owasp-juice.shop
| Subject Alternative Name: DNS:*.owasp-juice.shop, DNS:owasp-juice.shop
| Not valid before: 2023-10-01T00:00:00
|_Not valid after:  2024-10-13T23:59:59
| http-robots.txt: 1 disallowed entry
|_/ftp
|_http-cors: HEAD GET POST PUT DELETE PATCH
| http-server-header:
|   Apache/2.4.62 (Unix)
|_  Cowboy
2000/tcp open  tcpwrapped
5060/tcp open  tcpwrapped
8080/tcp open  http-proxy F5 BIG-IP load balancer http proxy
| http-server-header:
|   BigIP
|_  Cowboy
Service Info: Device: load balancer

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 90.35 second