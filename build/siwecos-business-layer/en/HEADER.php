<?php

return [

  /*
  |--------------------------------------------------------------------------
  | Language Lines
  |--------------------------------------------------------------------------
  |
  | This is a generated file.
  |
  | Any manual change will be lost.
  |
  */

  // These are the en texts for
  'SCANNER_NAME' => "Header Scanner",

  // Test: CONTENT_SECURITY_POLICY
  'CONTENT_SECURITY_POLICY_HEADLINE'      => "Check of the Content Security Policy (CSP)",
  'CONTENT_SECURITY_POLICY_POSITIVE'      => "A secure configuration of the <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Content_Security_Policy\">Content Security Policy (CSP)</a> was found.",
  'CONTENT_SECURITY_POLICY_NEGATIVE'      => "Content Security Policy insecure",
  'CONTENT_SECURITY_POLICY_DESCRIPTION'   => "<p>The <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Content_Security_Policy\">Content Security Policy (CSP)</a> is a security concept that is designed to reduce the risk of injection and execution of malicious commands in a web application (content injection attacks). By means of a whitelist (list of allowed sources), it determines from which sources Javascript code, images, fonts, and other content may be integrated into your site. </p>",
  'CONTENT_SECURITY_POLICY_SOLUTION_TIPS' => "<p>Use the CSP with default-src 'none' or 'self' and without unsafe-eval or unsafe-inline directives. For more information about <b>Content Security Policy</b>, please refer to <b><a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://wiki.selfhtml.org/wiki/Sicherheit/Content_Security_Policy\">SELFHTML&gt;&gt;</a></b> </p><p><br /> --snip<br /> </p><p><b>Example for the header on the start page:</b> </p> <pre> &lt;meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'self'; script-src 'self'\"&gt; &lt;meta http-equiv=\"X-Content-Security-Policy\" content=\"default-src 'self'; script-src 'self'\"&gt; &lt;meta http-equiv=\"X-WebKit-CSP\" content=\"default-src 'self'; script-src 'self'\"&gt;</pre> <p><b>Configuration of the web server</b> </p><p>If you can configure your own web server, which is usually not possible in low-budget hosting packages, there is this option via <b>changes to .htaccess</b>: </p> <pre># Download / Load content only from explicitly allowed sites # Example: Allow everything from own domain, nothing from external sources:  Header set Content-Security-Policy \"default-src 'none'; frame-src 'self'; font-src 'self';img-src 'self' siwecos.de; object-src 'self'; script-src 'self'; style-src 'self';\"  </pre> <p>--snap </p><p>Here is an example of an .htaccess file which will set the <b>Header Scanner</b> to green. (<a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Htaccess/EN\" title=\"Htaccess/EN\">.htaccess example</a>) </p>",
  'CONTENT_SECURITY_POLICY_LINK'          => "https://siwecos.de/wiki/Content-Security-Policy-Vulnerability/EN",

  // Test: CONTENT_TYPE
  'CONTENT_TYPE_HEADLINE'      => "Check of the HTTP content type",
  'CONTENT_TYPE_POSITIVE'      => "The content type is configured correctly.",
  'CONTENT_TYPE_NEGATIVE'      => "The HTTP content type is configured incorrectly",
  'CONTENT_TYPE_DESCRIPTION'   => "<p>The content type is a declaration that is usually placed in the header of a web page, the so-called HTTP header. This declaration defines the character set and the type of data that the page contains. If the definition is missing, the web browser will try to guess the content type; this can lead to security flaws such as Code-Page-Sniffing. This information is also important for rendering the web page correctly in every browser and on every computer. If a server sends a document to a <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/User_agent\">User Agent</a> (for example to the browser), it is helpful to supply some information about the file format in the content type field of the HTTP header. This information declares the <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Media_type\">MIME type</a> and sends the character encoding of the document, such as text/html, text/plain, etc. to the browser. </p>",
  'CONTENT_TYPE_SOLUTION_TIPS' => "<p>Add the appropriate HTTP header or, alternatively, add a &lt;meta&gt; tag. Please note that, unlike a HTTP header, the &lt;meta&gt; tag can be attacked more easily. </p><p><b>text/html; charset=utf-8</b>; </p><p><b>--snip</b> </p> <pre>&lt;meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"&gt;</pre> <p><b>—snap</b> </p><p><br /> Furthermore, the server must be configured to send the correct charset information. In order to make these changes on the server, particular access rights are required. For further information about the different server configuration options, please refer to <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://www.w3.org/International/articles/http-charset/index.de\">W3.org</a>. </p><p>Moreover, it is also possible to pass the correct charset information to the <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"http://httpd.apache.org/docs/2.0/howto/htaccess.html\"><b>.htaccess</b></a> file, which will overwrite the declaration in the HTTP header. <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://www.w3.org/International/questions/qa-htaccess-charset\">charset in .htaccess</a> </p><p><b>Enter in the .htaccess file:</b> </p> <pre>AddType 'text/html; charset=UTF-8' html</pre> <p>Here is an example of an .htaccess file which will set the <b>Header Scanner</b> to green. (<a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Htaccess/EN\" title=\"Htaccess/EN\">.htaccess example</a>) </p>",
  'CONTENT_TYPE_LINK'          => "https://siwecos.de/wiki/Content-Type-Not-Correct/EN",

  // Test: PUBLIC_KEY_PINS
  'PUBLIC_KEY_PINS_HEADLINE'      => "Check of Public Key Pinning (HPKP) - does not influence the score",
  'PUBLIC_KEY_PINS_POSITIVE'      => "<a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/HTTP_Public_Key_Pinning\">Public Key Pinning</a> is active (The result does not influence the score).",
  'PUBLIC_KEY_PINS_NEGATIVE'      => "<a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/HTTP_Public_Key_Pinning\">Public Key Pinning</a> is not available (HPKP is currently not under review).",
  'PUBLIC_KEY_PINS_DESCRIPTION'   => "<p>Powerful attackers, such as intelligence agencies, can create a signature with the help of a certification agency that is accepted by users. To prevent this, a website can be configured so that the <a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Certificate\" title=\"Certificate\">certificate</a> must be saved permanently (pinning) when it is called up for the first time. If <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/HTTP_Public_Key_Pinning\">Key Pinning</a> is used, only the saved certificate will be accepted for the period of time specified by the website. </p>",
  'PUBLIC_KEY_PINS_SOLUTION_TIPS' => "<p>The setting of <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/HTTP_Public_Key_Pinning\">Public Key Pinning</a> (HPKP) is not an absolute must, and is currently not taken into account by the SIWECOS Scanner. </p><p>The browsers Mozilla Firefox and Google Chrome comply with <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/HTTP_Public_Key_Pinning\">Public Key Pinning</a> and therefore ignore HPKP-headers. If only a single pin is set, an error message will appear. In order for pin validation to be successful, it is therefore always necessary to provide at least two public keys or a back-up pin. Interested parties should get in touch with an IT security expert or web developer. </p><p>Further information can be found at <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://www.zdnet.com/article/google-chrome-is-backing-away-from-public-key-pinning-and-heres-why/\">Article from ZDNET</a> </p><p><br /> </p><p><br /> </p>",
  'PUBLIC_KEY_PINS_LINK'          => "https://siwecos.de/wiki/Public-Key-Pins-Disabled/EN",

  // Test: REFERRER_POLICY
  'REFERRER_POLICY_HEADLINE'      => "Checking the Referrer Policy",
  'REFERRER_POLICY_POSITIVE'      => "Referrer Policy is secure",
  'REFERRER_POLICY_NEGATIVE'      => "Referrer Policy is insecure",
  'REFERRER_POLICY_DESCRIPTION'   => "<p>A well-defined Referrer Policy <b>protects the privacy</b> of your website visitors, but has no <i>direct</i> influence on the security of your website. </p>",
  'REFERRER_POLICY_SOLUTION_TIPS' => "<p>We recommend that the Referrer Policy Header be set to be as restrictive as possible, i.e. to be set to ”no-referrer,\" for example. </p> <h1><span class=\"mw-headline\" id=\".3D_Examples_.3D\">= Examples =</span></h1> <p><b>Referrer Policy Definition by Server Header:</b> </p> <pre> # Referrer Policy Header set referrer-Policy \"no-referrer\" </pre> <p><b>Referrer Policy Definition by HTML code:</b> </p> <pre> &lt;meta name=\"referrer\" content=\"no-referrer\" \"/&gt; </pre> <p><b>Statement:</b> The value `<b>no-referrer</b>` instructs the browser to send <b>Never</b> <i>Referer Header</i>, which is provided by your site. This includes links to pages on your own website. </p><p><br /> </p> <table class=\"wikitable\" style=\"margin:auto;”\"> <tr> <td> style=\"border: 4px solid #C31622; color:#000000; background-color:#f6f6f6;\" </td> <td> Other useful instructions can be `<b>same-origin</b>`, `<b>strict-origin</b>` or `<b>origin-when-cross-origin`</b>. </td></tr></table> <p><br /> </p> <pre>The value `<b>same origin</b>` instructs the browser to send only <i>Referer Header</i> provided by your website. If the target is another <a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Domain\" title=\"Domain\">domain</a>, no referrer information will be sent. </pre> <p>The value `<b>strict-origin</b>` instructs the browser, to always indicate the origin domain as <i>Referer Header</i>. </p><p>The value <b>origin-when-cross-origin</b>` instructs the browser to send the full referrer URL only if you stay on the same <a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Domain\" title=\"Domain\">Domain</a>. Once the domain is left via <a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/HTTPS\" title=\"HTTPS\">HTTPS</a> or another <a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Domain\" title=\"Domain\">Domain</a>  is addressed, only the source domain is sent. </p><p>Detailed information and examples can be found at <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://scotthelme.co.uk/a-new-security-header-referrer-policy/Scott\">Helme</a>. </p>",
  'REFERRER_POLICY_LINK'          => "https://siwecos.de/wiki/Referrer-Policy/EN",

  // Test: SET_COOKIE
  'SET_COOKIE_HEADLINE'      => "Check of Set-Cookie",
  'SET_COOKIE_POSITIVE'      => "Cookies are secured.",
  'SET_COOKIE_NEGATIVE'      => "Cookies are not secured.",
  'SET_COOKIE_DESCRIPTION'   => "<p>Cookies should be secured by setting the HttpOnly and Secure flags to ensure they cannot be read or altered by others. </p>",
  'SET_COOKIE_SOLUTION_TIPS' => "<p>`httpOnly`-flag: set this so that cookies cannot be accessed by Javascript. You protect session information from being stolen and misused. Whoever owns a session cookie is authenticated. `secure`-Flag: set this to ensure that cookies are only transmitted across encrypted (https) channels. </p>",
  'SET_COOKIE_LINK'          => "https://siwecos.de/wiki/Set-Cookie/EN",

  // Test: STRICT_TRANSPORT_SECURITY
  'STRICT_TRANSPORT_SECURITY_HEADLINE'      => "Check of HSTS protection",
  'STRICT_TRANSPORT_SECURITY_POSITIVE'      => "Your website can only be reached via the secure HTTPS protocol. Communication between your website and its visitors can not be intercepted or manipulated.",
  'STRICT_TRANSPORT_SECURITY_NEGATIVE'      => "HSTS protection error",
  'STRICT_TRANSPORT_SECURITY_DESCRIPTION'   => "<p><a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security\">HTTP Strict Transport Security (HSTS)</a> ensures that the website can only be accessed via a secure HTTPS connection for a specified time period. The website operator can define the length of the time period, and whether this rule should also apply to subdomains. </p>",
  'STRICT_TRANSPORT_SECURITY_SOLUTION_TIPS' => "<p>max-age=63072000; includeSubdomains; HTTP Strict Transport Security (HSTS) is a web security policy mechanism that is easy to integrate. </p> <b>--snip</b><pre> # Activate HTTP Strict Transport Security (HSTS) # Required: \"max-age\" # Optional: \"includeSubDomains\"</pre> <pre>  <b>Header set Strict-Transport-Security \"max-age=31556926; includeSubDomains\"</b> </pre> <p><b>--snap</b> </p><p>Here is an example of an .htaccess file which will set the <b>Header Scanner</b> to green. (<a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Htaccess/EN\" title=\"Htaccess/EN\">.htaccess example</a>) </p>",
  'STRICT_TRANSPORT_SECURITY_LINK'          => "https://siwecos.de/wiki/No-Encryption-Found/EN",

  // Test: X_CONTENT_TYPE_OPTIONS
  'X_CONTENT_TYPE_OPTIONS_HEADLINE'      => "Check of the X-Content-Type header",
  'X_CONTENT_TYPE_OPTIONS_POSITIVE'      => "The HTTP header is set correctly.",
  'X_CONTENT_TYPE_OPTIONS_NEGATIVE'      => "X-Content-Type header is missing.",
  'X_CONTENT_TYPE_OPTIONS_DESCRIPTION'   => "<p>The X-Content-Type-Options settings in the header prevent that the browser interprets data as anything other than declared by the content type in the HTTP header. The header settings are not set here. </p>",
  'X_CONTENT_TYPE_OPTIONS_SOLUTION_TIPS' => "<p>nosniff; <br /><br /> <b>Code example of an .htaccess file on an Apache webserver.</b><br /> </p> <b>--snip</b><pre> &lt;IfModule mod_headers.c&gt;    # prevent mime based attacks like drive-by download attacks, IE and Chrome    '''Header set X-Content-Type-Options \"nosniff\"''' &lt;pre&gt;&lt;/IfModule&gt;</pre> <p><b>—snap</b> </p><p>Here is an example of an .htaccess file which will set the <b>Header Scanner</b> to green. (<a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Htaccess/EN\" title=\"Htaccess/EN\">.htaccess example</a>) </p>",
  'X_CONTENT_TYPE_OPTIONS_LINK'          => "https://siwecos.de/wiki/X-Content-Type-Options-Vulnerability/EN",

  // Test: X_FRAME_OPTIONS
  'X_FRAME_OPTIONS_HEADLINE'      => "Checking the HTTP header X-frame options",
  'X_FRAME_OPTIONS_POSITIVE'      => "The header is set correctly and improves the protection of your website against clickjacking attacks.",
  'X_FRAME_OPTIONS_NEGATIVE'      => "HTTP header X-Frame-Options not set.",
  'X_FRAME_OPTIONS_DESCRIPTION'   => "<p>X-Frame-Options helps to prevent attacks carried out by rendering content within a frame. This largely mitigates the risk of <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Clickjacking\">clickjacking attacks</a>. Downgrading attacks, as known in the Internet Explorer, are also minimized. </p>",
  'X_FRAME_OPTIONS_SOLUTION_TIPS' => "<p>Set in the HTTP header according to your requirements. The <b>X-Frame-Options</b> field in the HTTP header can be used to determine whether a browser is allowed to render or embed the target page in a &lt;frame&gt;, &lt;iframe&gt; or &lt;object&gt;. Websites can use this header to deflect clickjacking attacks by preventing their content from being embedded in third party pages. </p><p>With the HTTP-Header command X-Frame-Options, modern web browsers can be instructed to prevent loading a page in a frame on another website. To do this, the following setting must be entered in the .htaccess file: </p><p>Header always append X-Frame-Options DENY </p><p><b>--snip</b> </p> <pre> Header always append X-Frame-Options DENY </pre> <p><b>—snap</b> </p><p>Alternatively, you can permit the page to be embedded only in other pages within the same domain: </p><p><b>--snip</b> </p> <pre> Header always append X-Frame-Options SAMEORIGIN </pre> <p><b>—snap</b> </p><p>If a website must be embedded in an external page, a domain can be specified: </p><p><b>--snip</b> </p> <pre> Header always append X-Frame-Options ALLOW-FROM botfrei.de </pre> <p><b>—snap</b> </p><p><br /> Here is an example of an .htaccess file which will set the <b>Header Scanner</b> to green. (<a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Htaccess/EN\" title=\"Htaccess/EN\">.htaccess example</a>) </p>",
  'X_FRAME_OPTIONS_LINK'          => "https://siwecos.de/wiki/X-Frame-Options-Vulnerability/EN",

  // Test: X_XSS_PROTECTION
  'X_XSS_PROTECTION_HEADLINE'      => "Check of the X-Content-Type header",
  'X_XSS_PROTECTION_POSITIVE'      => "<a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Cross-site_scripting\">Cross-site scripting</a> (XSS) protection of the web browser is active on your website.",
  'X_XSS_PROTECTION_NEGATIVE'      => "<a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Cross-site_scripting\">Cross-site scripting</a> protection is not active or configured incorrectly.",
  'X_XSS_PROTECTION_DESCRIPTION'   => "<p>The HTTP header X-XSS-Protection defines how built-in XSS filters in the browser are configured. A default installation can indicate an incorrect configuration. </p>",
  'X_XSS_PROTECTION_SOLUTION_TIPS' => "<p>1; mode=block </p><p><b>Code example of an .htaccess file on an Apache webserver.</b> </p> <b>--snip</b><br /><pre>    # Turn on XSS prevention tools, activated by default in IE and Chrome    '''Header set X-XSS-Protection \"1; mode=block\"''' </pre> <p><b>—snap</b> </p><p>Here is an example of an .htaccess file which will set the <b>Header Scanner</b> to green. (<a target=\"siwecos_wiki\" href=\"https://siwecos.de/wiki/Htaccess/EN\" title=\"Htaccess/EN\">.htaccess example</a>) </p>",
  'X_XSS_PROTECTION_LINK'          => "https://siwecos.de/wiki/XSS-Vulnerability/EN",

  // Result texts follow
  'CSP_CORRECT'               => "The header is set correctly and corresponds to the recommendations.",
  'CSP_DEFAULT_SRC_MISSING'   => "The default-src directive is missing.",
  'CSP_LEGACY_HEADER_SET'     => "The outdated header 'X-Content-Security-Policy' is used. The new standardized header is 'Content-Security-Policy'.",
  'CSP_NO_UNSAFE_INCLUDED'    => "The <a target=\"siwecos_extern\" rel=\"nofollow\" class=\"external text\" href=\"https://en.wikipedia.org/wiki/Content_Security_Policy\">Content Security Policy (CSP)</a> does not contain any unsafe directives, but it may not be configured securely.",
  'CSP_UNSAFE_INCLUDED'       => "The header is set insecurely because it contains 'unsafe-inline' or 'unsafe-eval' directives.",
  'CT_CORRECT'                => "The header is set correctly and corresponds to the recommendations.",
  'CT_HEADER_WITHOUT_CHARSET' => "The header is used without a character set and thus not safe.",
  'CT_HEADER_WITH_CHARSET'    => "The header is set correctly and contains a character set specification.",
  'CT_META_TAG_SET'           => "The header is set correctly, but it does not contain a character set specification or does not correspond to the recommendations. \"%META%\" was found.",
  'CT_META_TAG_SET_CORRECT'   => "The \"%META%\" specification in the HTML header is set correctly.",
  'CT_WRONG_CHARSET'          => "A false or invalid character set was used. The configuration is not safe.",
  'HEADER_ENCODING_ERROR'     => "The header <b>%HEADER_NAME%</b> contains characters which cannot be processed.",
  'HEADER_NOT_SET'            => "The header is not set.",
  'HEADER_SET_MULTIPLE_TIMES' => "The header was set several times.",
  'HPKP_LESS_15'              => "The public keys are pinned for less than 15 days.",
  'HPKP_MORE_15'              => "The public keys are pinned for more than 15 days.",
  'HPKP_REPORT_URI'           => "A 'report-uri' is set.",
  'HSTS_LESS_6'               => "The value of 'max-age' is less than 6 months.",
  'HSTS_MORE_6'               => "The value of 'max-age' is greater than 6 months.",
  'HSTS_PRELOAD'              => "The 'preload' directive is set.",
  'HTTPONLY_FLAG_SET'         => "The HttpOnly flag is set.",
  'INCLUDE_SUBDOMAINS'        => "'includeSubDomains' is set.",
  'MAX_AGE_ERROR'             => "There was an error while checking the 'max-age' directive.",
  'NO_HTTPONLY_FLAG_SET'      => "The HttpOnly flag is not set.",
  'NO_HTTP_RESPONSE'          => "The specified URL did not respond.",
  'NO_REFERRER'               => "<pre>tThe directive no-referrer is set. </pre>",
  'NO_SECURE_FLAG_SET'        => "The secure flag is not set.",
  'XCTO_CORRECT'              => "The header is set correctly and corresponds to the recommendations.",
  'XCTO_NOT_CORRECT'          => "The header is not set correctly.",
  'XFO_CORRECT'               => "The header is set correctly and corresponds to the recommendations.",
  'XFO_WILDCARDS'             => "The header contains wildcard information (*) and is therefore not configured securely.",
  'XXSS_BLOCK'                => "The 'mode=block' directive is active.",
  'XXSS_CORRECT'              => "The header is set correctly and corresponds to the recommendations.",

];
