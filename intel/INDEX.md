# Disclosed reports by class

111 public HackerOne reports, grouped by vulnerability class.
A report can appear under more than one class. Regenerate with:

    python3 scripts/build-intel-index.py

Each entry links to the report on HackerOne and to the saved local file
(which has a Learning Notes section to fill in while reading).

## Counts

| Class | Reports |
|---|---|
| [Account takeover / Auth bypass](#account-takeover--auth-bypass) | 19 |
| [Business logic](#business-logic) | 19 |
| [Information disclosure / secrets](#information-disclosure--secrets) | 18 |
| [RCE / Command injection](#rce--command-injection) | 17 |
| [Memory / TLS / transport](#memory--tls--transport) | 14 |
| [XSS](#xss) | 10 |
| [Denial of service / crash](#denial-of-service--crash) | 8 |
| [Access control / IDOR](#access-control--idor) | 6 |
| [File upload](#file-upload) | 5 |
| [Request smuggling](#request-smuggling) | 5 |
| [File read / LFI / traversal](#file-read--lfi--traversal) | 4 |
| [SQLi](#sqli) | 4 |
| [GraphQL](#graphql) | 3 |
| [OAuth / SSO / SAML](#oauth--sso--saml) | 3 |
| [Open redirect](#open-redirect) | 3 |
| [Race condition](#race-condition) | 3 |
| [Cache poisoning](#cache-poisoning) | 2 |
| [SSRF](#ssrf) | 2 |
| [SSTI / Template injection](#ssti--template-injection) | 1 |
| [Subdomain takeover](#subdomain-takeover) | 1 |
| [Uncategorised](#uncategorised) | 20 |

## Account takeover / Auth bypass

- [Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation to Any Shop Owner by Taking Advantage of the Shopify SSO](https://hackerone.com/reports/791775) — shopify · Critical · 1920 votes · `791775`
- [Account takeover via leaked session cookie](https://hackerone.com/reports/745324) — security · High · 1642 votes · `745324`
- [Token leak in security challenge flow allows retrieving victim's PayPal email and plain text password](https://hackerone.com/reports/739737) — paypal · High · 1409 votes · `739737`
- [Account Takeover via Password Reset without user interactions](https://hackerone.com/reports/2293343) — gitlab · Critical · 987 votes · `2293343`
- [Improper Authentication - any user can login as other user with otp/logout & otp/login](https://hackerone.com/reports/921780) — snapchat · Critical · 971 votes · `921780`
- [[Part II] Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation](https://hackerone.com/reports/796808) — shopify · Critical · 894 votes · `796808`
- [Mass account takeovers using HTTP Request Smuggling on https://slackb.com/ to steal session cookies](https://hackerone.com/reports/737140) — slack · Critical · 870 votes · `737140`
- [Subdomain Takeover to Authentication bypass](https://hackerone.com/reports/335330) — roblox · Critical · 782 votes · `335330`
- [Ability to reset password for account](https://hackerone.com/reports/322985) — upserve · Critical · 635 votes · `322985`
- [The /reports/:id.json endpoint discloses potentially sensitive user attributes when reporter summary is present](https://hackerone.com/reports/3000510) — security · Critical · 625 votes · `3000510`
- [Bypassing Digits origin validation which leads to account takeover](https://hackerone.com/reports/129873) — x · 619 votes · `129873`
- [Github Token Leaked publicly for https://github.sc-corp.net](https://hackerone.com/reports/396467) — snapchat · Critical · 582 votes · `396467`
- [Request smuggling on admin-official.line.me could lead to account takeover](https://hackerone.com/reports/740037) — line · High · 565 votes · `740037`
- [Email Confirmation Bypass in your-store.myshopify.com which leads to privilege escalation](https://hackerone.com/reports/910300) — shopify · Critical · 559 votes · `910300`
- [Stealing Zomato X-Access-Token: in Bulk using HTTP Request Smuggling on api.zomato.com](https://hackerone.com/reports/771666) — eternal · Critical · 559 votes · `771666`
- [Shopify Stocky App OAuth Misconfiguration](https://hackerone.com/reports/740989) — shopify · Medium · 527 votes · `740989`
- [One-click account hijack for anyone using Apple sign-in with Reddit, due to response-type switch + leaking href to XSS on www.redditmedia.com](https://hackerone.com/reports/1567186) — reddit · Critical · 509 votes · `1567186`
- [curl CONNECT response header colon-check bypass in cf-h1-proxy single_header — proxy authentication bypass via injected HTTP/1.x status line](https://hackerone.com/reports/4053116) — curl · High · 8 votes · `4053116`
- [SSH host-key policy is missing from the connection-reuse tuple: strict pins and knownhosts are silently skipped on reused SFTP/SCP connections](https://hackerone.com/reports/4126768) — curl · Low · 5 votes · `4126768`

## Business logic

- [Takeover an account that doesn't have a Shopify ID and more](https://hackerone.com/reports/867513) — shopify · Critical · 3005 votes · `867513`
- [Bypass for #488147 enables stored XSS on https://paypal.com/signin again](https://hackerone.com/reports/510152) — paypal · High · 2687 votes · `510152`
- [Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation to Any Shop Owner by Taking Advantage of the Shopify SSO](https://hackerone.com/reports/791775) — shopify · Critical · 1920 votes · `791775`
- [Improper Authentication - any user can login as other user with otp/logout & otp/login](https://hackerone.com/reports/921780) — snapchat · Critical · 971 votes · `921780`
- [[Part II] Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation](https://hackerone.com/reports/796808) — shopify · Critical · 894 votes · `796808`
- [Subdomain Takeover to Authentication bypass](https://hackerone.com/reports/335330) — roblox · Critical · 782 votes · `335330`
- [Getting all the CD keys of any game](https://hackerone.com/reports/391217) — valve · Critical · 638 votes · `391217`
- [Bypassing Digits origin validation which leads to account takeover](https://hackerone.com/reports/129873) — x · 619 votes · `129873`
- [Stored XSS on imgur profile](https://hackerone.com/reports/484434) — imgur · Medium · 613 votes · `484434`
- [The return of the ＜](https://hackerone.com/reports/639684) — rockstargames · High · 574 votes · `639684`
- [Email Confirmation Bypass in your-store.myshopify.com which leads to privilege escalation](https://hackerone.com/reports/910300) — shopify · Critical · 559 votes · `910300`
- [Shopify Stocky App OAuth Misconfiguration](https://hackerone.com/reports/740989) — shopify · Medium · 527 votes · `740989`
- [Remote Code Execution in Slack desktop apps + bonus](https://hackerone.com/reports/783877) — slack · Critical · 508 votes · `783877`
- [Open redirect on app.hey.com bypasses HEY desktop's internal-origin allowlist and loads attacker content inside a HEY BrowserWindow](https://hackerone.com/reports/3972760) — basecamp · Medium · 29 votes · `3972760`
- [Explicit NO_PROXY /0 CIDR rules fail to bypass HTTP proxy for IP-literal requests](https://hackerone.com/reports/4114965) — curl · Low · 12 votes · `4114965`
- [Application Data Hiding via Invalid `iconName` Causing Frontend Crash in Nextcloud Tables](https://hackerone.com/reports/3508852) — nextcloud · Low · 9 votes · `3508852`
- [curl CONNECT response header colon-check bypass in cf-h1-proxy single_header — proxy authentication bypass via injected HTTP/1.x status line](https://hackerone.com/reports/4053116) — curl · High · 8 votes · `4053116`
- [SSH host-key policy is missing from the connection-reuse tuple: strict pins and knownhosts are silently skipped on reused SFTP/SCP connections](https://hackerone.com/reports/4126768) — curl · Low · 5 votes · `4126768`
- [wolfSSL Backend Silently Ignores --cert-status (OCSP Stapling Bypass)](https://hackerone.com/reports/4127399) — curl · Medium · 1 votes · `4127399`

## Information disclosure / secrets

- [Account takeover via leaked session cookie](https://hackerone.com/reports/745324) — security · High · 1642 votes · `745324`
- [Github access token exposure](https://hackerone.com/reports/1087489) — shopify · Critical · 1596 votes · `1087489`
- [Token leak in security challenge flow allows retrieving victim's PayPal email and plain text password](https://hackerone.com/reports/739737) — paypal · High · 1409 votes · `739737`
- [Exposed Kubernetes API - RCE/Exposed Creds](https://hackerone.com/reports/455645) — snapchat · Critical · 1191 votes · `455645`
- [Improper Authentication - any user can login as other user with otp/logout & otp/login](https://hackerone.com/reports/921780) — snapchat · Critical · 971 votes · `921780`
- [WannaCrypt “Killswitch”](https://hackerone.com/reports/228648) — security · 809 votes · `228648`
- [JumpCloud API Key leaked via Open Github Repository.](https://hackerone.com/reports/716292) — starbucks · Critical · 739 votes · `716292`
- [Sensitive user information disclosure at bonjour.uber.com/marketplace/_rpc via the 'userUuid' parameter](https://hackerone.com/reports/542340) — uber · High · 643 votes · `542340`
- [The /reports/:id.json endpoint discloses potentially sensitive user attributes when reporter summary is present](https://hackerone.com/reports/3000510) — security · Critical · 625 votes · `3000510`
- [Github Token Leaked publicly for https://github.sc-corp.net](https://hackerone.com/reports/396467) — snapchat · Critical · 582 votes · `396467`
- [Publicly accessible Continuous Integration Tool](https://hackerone.com/reports/313457) — snapchat · Critical · 562 votes · `313457`
- [Privilege Escalation From user to SYSTEM via unauthenticated command execution](https://hackerone.com/reports/544928) — ui · Critical · 553 votes · `544928`
- [[Grab Android/iOS] Insecure deeplink leads to sensitive information disclosure](https://hackerone.com/reports/401793) — grab · High · 551 votes · `401793`
- [Server Side Request Forgery (SSRF) via Analytics Reports](https://hackerone.com/reports/2262382) — security · Critical · 529 votes · `2262382`
- [[Pre-Submission][H1-4420-2019] API access to Phabricator on code.uberinternal.com from leaked certificate in git repo](https://hackerone.com/reports/591813) — uber · Critical · 457 votes · `591813`
- [Ordinary HEY user can make HEY originate authenticated mail from attacker-selected @hey.com  addresses](https://hackerone.com/reports/4035023) — basecamp · High · 14 votes · `4035023`
- [CVE-2026-107928: info leak uploading over WebSockets with GnuTLS](https://hackerone.com/reports/4099194) — curl · Low · 7 votes · `4099194`
- [Cross-origin redirect reuses a pooled Negotiate-authenticated connection from an unrelated transfer](https://hackerone.com/reports/3981716) — curl · Medium · 3 votes · `3981716`

## RCE / Command injection

- [RCE on Steam Client via buffer overflow in Server Info](https://hackerone.com/reports/470520) — valve · Critical · 1288 votes · `470520`
- [Potential pre-auth RCE on Twitter VPN](https://hackerone.com/reports/591295) — x · Critical · 1245 votes · `591295`
- [Exposed Kubernetes API - RCE/Exposed Creds](https://hackerone.com/reports/455645) — snapchat · Critical · 1191 votes · `455645`
- [RCE via npm misconfig -- installing internal libraries from the public registry](https://hackerone.com/reports/925585) — paypal · Critical · 945 votes · `925585`
- [H1514 Remote Code Execution on kitcrm using bulk customer update of Priority Products](https://hackerone.com/reports/422944) — shopify · Medium · 830 votes · `422944`
- [Remote Code Execution on www.semrush.com/my_reports on Logo upload](https://hackerone.com/reports/403417) — semrush · Critical · 824 votes · `403417`
- [Websites Can Run Arbitrary Code on Machines Running the 'PlayStation Now' Application](https://hackerone.com/reports/873614) — playstation · Critical · 780 votes · `873614`
- [Git flag injection - local file overwrite to remote code execution](https://hackerone.com/reports/658013) — gitlab · Critical · 777 votes · `658013`
- [Use-After-Free In IPV6_2292PKTOPTIONS leading To Arbitrary Kernel R/W Primitives](https://hackerone.com/reports/826026) — playstation · High · 741 votes · `826026`
- [Webshell via File Upload on ecjobs.starbucks.com.cn](https://hackerone.com/reports/506646) — starbucks · Critical · 688 votes · `506646`
- [RCE and Complete Server Takeover of http://www.█████.starbucks.com.sg/](https://hackerone.com/reports/502758) — starbucks · Critical · 572 votes · `502758`
- [Local files could be overwritten in GitLab, leading to remote command execution](https://hackerone.com/reports/587854) — gitlab · Critical · 542 votes · `587854`
- [RCE when removing metadata with ExifTool](https://hackerone.com/reports/1154542) — gitlab · Critical · 508 votes · `1154542`
- [Remote Code Execution in Slack desktop apps + bonus](https://hackerone.com/reports/783877) — slack · Critical · 508 votes · `783877`
- [Remote Command Execution via Github import](https://hackerone.com/reports/1679624) — gitlab · Critical · 392 votes · `1679624`
- [RCE via the DecompressedArchiveSizeValidator and Project BulkImports (behind feature flag)](https://hackerone.com/reports/1609965) — gitlab · Critical · 387 votes · `1609965`
- [[Switch] Remote stack buffer overflow in the LDN/LP2P DHCP server leads to control-flow hijack](https://hackerone.com/reports/3770768) — nintendo · High · 34 votes · `3770768`

## Memory / TLS / transport

- [RCE on Steam Client via buffer overflow in Server Info](https://hackerone.com/reports/470520) — valve · Critical · 1288 votes · `470520`
- [Potential pre-auth RCE on Twitter VPN](https://hackerone.com/reports/591295) — x · Critical · 1245 votes · `591295`
- [[Pre-Submission][H1-4420-2019] API access to Phabricator on code.uberinternal.com from leaked certificate in git repo](https://hackerone.com/reports/591813) — uber · Critical · 457 votes · `591813`
- [[Switch] Remote stack buffer overflow in the LDN/LP2P DHCP server leads to control-flow hijack](https://hackerone.com/reports/3770768) — nintendo · High · 34 votes · `3770768`
- [libcurl shared-HSTS-cache race leads to use-after-free with attacker-controlled function-pointer call](https://hackerone.com/reports/4122039) — curl · Critical · 7 votes · `4122039`
- [CVE-2026-107928: info leak uploading over WebSockets with GnuTLS](https://hackerone.com/reports/4099194) — curl · Low · 7 votes · `4099194`
- [TLS session cache key omits native_ca_store: a session validated with CURLSSLOPT_NATIVE_CA can be resumed by a transfer that disabled it (incomplete f](https://hackerone.com/reports/4123646) — curl · Low · 5 votes · `4123646`
- [One Strict-Transport-Security response header empties the victim's entire HSTS store, silently,](https://hackerone.com/reports/4007917) — curl · Medium · 5 votes · `4007917`
- [Symlink-following truncation of arbitrary files in `Curl_fopen()` when saving cookie jars, HSTS, or alt-svc caches](https://hackerone.com/reports/4125257) — curl · Low · 2 votes · `4125257`
- [libcurl TLS shorter-retry mismatch discloses client heap memory during cancelled IMAPS upload](https://hackerone.com/reports/4105853) — curl · Medium · 2 votes · `4105853`
- [HSTS cache file: three trailing dots silently disable HSTS for that host](https://hackerone.com/reports/4129642) — curl · Medium · 1 votes · `4129642`
- [TLS session cache ignores CURLOPT_SSL_CTX_FUNCTION identity and resumes one client's session for another](https://hackerone.com/reports/4129638) — curl · Medium · 1 votes · `4129638`
- [wolfSSL Backend Silently Ignores --cert-status (OCSP Stapling Bypass)](https://hackerone.com/reports/4127399) — curl · Medium · 1 votes · `4127399`
- [curl reuses an HTTPS connection when a response is already buffered in the TLS stack](https://hackerone.com/reports/4128703) — curl · Medium · 0 votes · `4128703`

## XSS

- [Bypass for #488147 enables stored XSS on https://paypal.com/signin again](https://hackerone.com/reports/510152) — paypal · High · 2687 votes · `510152`
- [Stored XSS on https://paypal.com/signin via cache poisoning](https://hackerone.com/reports/488147) — paypal · High · 685 votes · `488147`
- [Stored XSS in Wiki pages](https://hackerone.com/reports/526325) — gitlab · High · 629 votes · `526325`
- [Stored XSS on imgur profile](https://hackerone.com/reports/484434) — imgur · Medium · 613 votes · `484434`
- [The return of the ＜](https://hackerone.com/reports/639684) — rockstargames · High · 574 votes · `639684`
- [One-click account hijack for anyone using Apple sign-in with Reddit, due to response-type switch + leaking href to XSS on www.redditmedia.com](https://hackerone.com/reports/1567186) — reddit · Critical · 509 votes · `1567186`
- [Remote Code Execution in Slack desktop apps + bonus](https://hackerone.com/reports/783877) — slack · Critical · 508 votes · `783877`
- [XSS in steam react chat client](https://hackerone.com/reports/409850) — valve · Critical · 497 votes · `409850`
- [Burp Suite OpenAPI Event Log HTML injection triggers Windows SMB authentication](https://hackerone.com/reports/3972558) — portswigger · Medium · 54 votes · `3972558`
- [Stored XSS on the public Pontoon dashboards: the latest-activity tooltip re-parses a contributor's account address as HTML](https://hackerone.com/reports/3988961) — mozilla · High · 51 votes · `3988961`

## Denial of service / crash

- [DoS on PayPal via web cache poisoning](https://hackerone.com/reports/622122) — paypal · Medium · 851 votes · `622122`
- [Use-After-Free In IPV6_2292PKTOPTIONS leading To Arbitrary Kernel R/W Primitives](https://hackerone.com/reports/826026) — playstation · High · 741 votes · `826026`
- [Memory exhaustion (DoS) via unbounded file read in `EncodingDiscovery.detect_encoding()`](https://hackerone.com/reports/4028616) — weblate · Medium · 21 votes · `4028616`
- [Uncaught RecursionError crash in translation-finder (deep directory tree DoS)](https://hackerone.com/reports/4022462) — weblate · Low · 15 votes · `4022462`
- [Application Data Hiding via Invalid `iconName` Causing Frontend Crash in Nextcloud Tables](https://hackerone.com/reports/3508852) — nextcloud · Low · 9 votes · `3508852`
- [WebSocket decoder use-after-free when curl_easy_pause() unpauses from a debug callback](https://hackerone.com/reports/4123749) — curl · None · 8 votes · `4123749`
- [libcurl shared-HSTS-cache race leads to use-after-free with attacker-controlled function-pointer call](https://hackerone.com/reports/4122039) — curl · Critical · 7 votes · `4122039`
- [WebSocket send queue use-after-free during nested curl_ws_send()](https://hackerone.com/reports/4124722) — curl · Low · 2 votes · `4124722`

## Access control / IDOR

- [Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation to Any Shop Owner by Taking Advantage of the Shopify SSO](https://hackerone.com/reports/791775) — shopify · Critical · 1920 votes · `791775`
- [[Part II] Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation](https://hackerone.com/reports/796808) — shopify · Critical · 894 votes · `796808`
- [IDOR to add secondary users in www.paypal.com/businessmanage/users/api/v1/users](https://hackerone.com/reports/415081) — paypal · High · 797 votes · `415081`
- [Email Confirmation Bypass in your-store.myshopify.com which leads to privilege escalation](https://hackerone.com/reports/910300) — shopify · Critical · 559 votes · `910300`
- [Privilege Escalation From user to SYSTEM via unauthenticated command execution](https://hackerone.com/reports/544928) — ui · Critical · 553 votes · `544928`
- [Able to Become Admin for Any LINE Official Account](https://hackerone.com/reports/698579) — line · Critical · 493 votes · `698579`

## File upload

- [Arbitrary file read via the UploadsRewriter when moving and issue](https://hackerone.com/reports/827052) — gitlab · Critical · 1503 votes · `827052`
- [Webshell via File Upload on ecjobs.starbucks.com.cn](https://hackerone.com/reports/506646) — starbucks · Critical · 688 votes · `506646`
- [Arbitrary file read  via the bulk imports UploadsPipeline](https://hackerone.com/reports/1439593) — gitlab · Critical · 329 votes · `1439593`
- [RTSP ANNOUNCE/SET_PARAMETER upload with --use-ascii / CURLOPT_TRANSFERTEXT sends more body bytes than the declared Content-Length (incomplete fix of e](https://hackerone.com/reports/4124486) — curl · Low · 5 votes · `4124486`
- [SCP upload with --crlf sends more bytes than the size declared to the server (same class curl refused for IMAP CVE-2026-87864 and RTSP)](https://hackerone.com/reports/4123654) — curl · Low · 5 votes · `4123654`

## Request smuggling

- [Bypass for #488147 enables stored XSS on https://paypal.com/signin again](https://hackerone.com/reports/510152) — paypal · High · 2687 votes · `510152`
- [Mass account takeovers using HTTP Request Smuggling on https://slackb.com/ to steal session cookies](https://hackerone.com/reports/737140) — slack · Critical · 870 votes · `737140`
- [Stored XSS on https://paypal.com/signin via cache poisoning](https://hackerone.com/reports/488147) — paypal · High · 685 votes · `488147`
- [Request smuggling on admin-official.line.me could lead to account takeover](https://hackerone.com/reports/740037) — line · High · 565 votes · `740037`
- [Stealing Zomato X-Access-Token: in Bulk using HTTP Request Smuggling on api.zomato.com](https://hackerone.com/reports/771666) — eternal · Critical · 559 votes · `771666`

## File read / LFI / traversal

- [Arbitrary file read via the UploadsRewriter when moving and issue](https://hackerone.com/reports/827052) — gitlab · Critical · 1503 votes · `827052`
- [Arbitrary file read  via the bulk imports UploadsPipeline](https://hackerone.com/reports/1439593) — gitlab · Critical · 329 votes · `1439593`
- [Memory exhaustion (DoS) via unbounded file read in `EncodingDiscovery.detect_encoding()`](https://hackerone.com/reports/4028616) — weblate · Medium · 21 votes · `4028616`
- [Symlink-following truncation of arbitrary files in `Curl_fopen()` when saving cookie jars, HSTS, or alt-svc caches](https://hackerone.com/reports/4125257) — curl · Low · 2 votes · `4125257`

## SQLi

- [SQL Injection Extracts Starbucks Enterprise Accounting, Financial, Payroll Database](https://hackerone.com/reports/531051) — starbucks · Critical · 801 votes · `531051`
- [SQL injection in https://labs.data.gov/dashboard/datagov/csv_to_json via User-agent](https://hackerone.com/reports/297478) — gsa_bbp · Critical · 699 votes · `297478`
- [SQL Injection in report_xml.php through countryFilter[] parameter](https://hackerone.com/reports/383127) — valve · Critical · 410 votes · `383127`
- [SQL Injection vulnerability found on IBM.com subdomain](https://hackerone.com/reports/3730301) — ibm · 33 votes · `3730301`

## GraphQL

- [Confidential data of users and limited metadata of programs and reports accessible via GraphQL](https://hackerone.com/reports/489146) — security · Critical · 1033 votes · `489146`
- [Email address of any user can be queried on Report Invitation GraphQL type when username is known](https://hackerone.com/reports/792927) — security · High · 671 votes · `792927`
- [The /reports/:id.json endpoint discloses potentially sensitive user attributes when reporter summary is present](https://hackerone.com/reports/3000510) — security · Critical · 625 votes · `3000510`

## OAuth / SSO / SAML

- [Email Confirmation Bypass in myshop.myshopify.com that Leads to Full Privilege Escalation to Any Shop Owner by Taking Advantage of the Shopify SSO](https://hackerone.com/reports/791775) — shopify · Critical · 1920 votes · `791775`
- [Shopify Stocky App OAuth Misconfiguration](https://hackerone.com/reports/740989) — shopify · Medium · 527 votes · `740989`
- [One-click account hijack for anyone using Apple sign-in with Reddit, due to response-type switch + leaking href to XSS on www.redditmedia.com](https://hackerone.com/reports/1567186) — reddit · Critical · 509 votes · `1567186`

## Open redirect

- [Remote Code Execution in Slack desktop apps + bonus](https://hackerone.com/reports/783877) — slack · Critical · 508 votes · `783877`
- [Open redirect on app.hey.com bypasses HEY desktop's internal-origin allowlist and loads attacker content inside a HEY BrowserWindow](https://hackerone.com/reports/3972760) — basecamp · Medium · 29 votes · `3972760`
- [Unauthenticated go-httpbin servers : Leads to Cookie Tossing on *.aws.dev and Open Redirect](https://hackerone.com/reports/3966599) — aws_vdp · Medium · 29 votes · `3966599`

## Race condition

- [Use-After-Free In IPV6_2292PKTOPTIONS leading To Arbitrary Kernel R/W Primitives](https://hackerone.com/reports/826026) — playstation · High · 741 votes · `826026`
- [TFTP accepts a first response from an IP other than the requested server](https://hackerone.com/reports/4103651) — curl · Low · 10 votes · `4103651`
- [libcurl shared-HSTS-cache race leads to use-after-free with attacker-controlled function-pointer call](https://hackerone.com/reports/4122039) — curl · Critical · 7 votes · `4122039`

## Cache poisoning

- [DoS on PayPal via web cache poisoning](https://hackerone.com/reports/622122) — paypal · Medium · 851 votes · `622122`
- [Stored XSS on https://paypal.com/signin via cache poisoning](https://hackerone.com/reports/488147) — paypal · High · 685 votes · `488147`

## SSRF

- [SSRF in Exchange leads to ROOT access in all instances](https://hackerone.com/reports/341876) — shopify · Medium · 585 votes · `341876`
- [Server Side Request Forgery (SSRF) via Analytics Reports](https://hackerone.com/reports/2262382) — security · Critical · 529 votes · `2262382`

## SSTI / Template injection

- [Exfiltrate and mutate repository and project data through injected templated service](https://hackerone.com/reports/446585) — gitlab · Critical · 762 votes · `446585`

## Subdomain takeover

- [Subdomain Takeover to Authentication bypass](https://hackerone.com/reports/335330) — roblox · Critical · 782 votes · `335330`

## Uncategorised

- [Delete anyone's content spotlight remotely.](https://hackerone.com/reports/1819832) — snapchat · High · 800 votes · `1819832`
- [Customer private program can disclose email any users through invited via username](https://hackerone.com/reports/807448) — security · High · 589 votes · `807448`
- [BAD Code !](https://hackerone.com/reports/180074) — paragonie · None · 549 votes · `180074`
- [Unauthenticated self-registration on ████████ grants full access to internal supplier procurement portal and vendor data](https://hackerone.com/reports/4071064) — essity · Medium · 27 votes · `4071064`
- [An organization admin can create an attacker-controlled organization owner via the gem transfer flow](https://hackerone.com/reports/3938927) — rubygems · High · 21 votes · `3938927`
- [SMTP header injection via C-escape `\r` in the recipient display name](https://hackerone.com/reports/3913007) — nextcloud · None · 19 votes · `3913007`
- [HTTP/1.1 connection reuse returns unsolicited server data as the next request's response (regression in 8.22.0)](https://hackerone.com/reports/4098761) — curl · Medium · 16 votes · `4098761`
- [libcurl RTSP `CURLOPT_CRLF` conversion allows a request body to become a second RTSP request](https://hackerone.com/reports/4113412) — curl · Low · 15 votes · `4113412`
- [Deck app: Invalid tag color is accepted by API and breaks frontend UI](https://hackerone.com/reports/3485178) — nextcloud · Low · 8 votes · `3485178`
- [CRLF injection in the HTTP request-line via `CURLOPT_REQUEST_TARGET` (`--request-target`)](https://hackerone.com/reports/4121689) — curl · High · 6 votes · `4121689`
- [Retry-independent time-condition HTTP/2 UAF](https://hackerone.com/reports/4033108) — curl · 6 votes · `4033108`
- [IBC2 Entry Points Skip SetupContractCost - Systematic Gas Underpricing](https://hackerone.com/reports/3547607) — cosmos · Medium · 6 votes · `3547607`
- [urlapi: CURLUPART_HOST accepts text after an IPv6 zone ip and URL round trip changes the host](https://hackerone.com/reports/4127756) — curl · Low · 5 votes · `4127756`
- [CURLOPT_PROXYHEADER is not part of the HTTP-proxy connection reuse key: a second CONNECT-tunnel transfer silently reuses the first tunnel's Proxy-Auth](https://hackerone.com/reports/4124549) — curl · Medium · 5 votes · `4124549`
- [curl RTSP connection reuse routes response headers to the RTP callback (rtsp_conn state machine not reset between sessions)](https://hackerone.com/reports/4121685) — curl · High · 5 votes · `4121685`
- [CRLF injection in the RTSP request-line and Transport header via `CURLOPT_RTSP_STREAM_URI` and `CURLOPT_RTSP_TRANSPORT`](https://hackerone.com/reports/4121675) — curl · High · 5 votes · `4121675`
- [CVE-2026-107929: local interface connection reuse mixup](https://hackerone.com/reports/4099618) — curl · Low · 5 votes · `4099618`
- [IMAP custom FETCH literals can spoof tagged responses and desynchronize reused connections](https://hackerone.com/reports/4021854) — curl · 5 votes · `4021854`
- [SSH (SCP/SFTP) host-key verification is skipped on connection reuse — a pinned/known_hosts transfer silently reuses a previously-unverified connection](https://hackerone.com/reports/4124583) — curl · Medium · 2 votes · `4124583`
- [POP3: data after the end-of-body terminator is written into the retrieved message](https://hackerone.com/reports/4132132) — curl · Medium · 1 votes · `4132132`
