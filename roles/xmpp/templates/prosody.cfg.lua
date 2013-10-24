daemonize = true
pidfile = "/run/prosody/prosody.pid"

admins = { }

use_libevent = false;

modules_enabled = {
		"roster"; -- Allow users to have a roster. Recommended ;)
		"saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
		"tls"; -- Add support for secure TLS on c2s/s2s connections
		"dialback"; -- s2s dialback support
		"disco"; -- Service discovery
		"private"; -- Private XML storage (for room bookmarks, etc.)
		"vcard"; -- Allow users to set vCards
		"privacy"; -- Support privacy lists
		"compression"; -- Stream compression
		"version"; -- Replies to server version requests
		"uptime"; -- Report how long server has been running
		"time"; -- Let others know the time here on this server
		"ping"; -- Replies to XMPP pings with pongs
		"pep"; -- Enables users to publish their mood, activity, playing music and more
		"register"; -- Allow users to register on this server using a client and change passwords
		"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
		"posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
		"groups"; -- Shared roster support
}

modules_disabled = { }

allow_registration = false;

ssl = {
	key = "/etc/prosody/certs/{{xmpp_host}}.key";
	certificate = "/etc/prosody/certs/{{xmpp_host}}.pem";
}

c2s_require_encryption = true
s2s_secure_auth = true
--s2s_insecure_domains = { "gmail.com" }
--s2s_secure_domains = { "jabber.org" }

authentication = "dovecot"
dovecot_auth_socket = "/var/spool/prosody/private/auth"
auth_append_host = true

log = {
	"*syslog"; -- Uncomment this for logging to syslog
}

----------- Virtual hosts -----------
-- You need to add a VirtualHost entry for each domain you wish Prosody to serve.
-- Settings under each VirtualHost entry apply *only* to that host.

VirtualHost "{{xmpp_host}}"
