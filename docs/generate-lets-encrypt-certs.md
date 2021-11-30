Generating Let's encrypt certificates
=====================================

Using a little helper, it is possible to generate let's encrypt certificates using dehydrated.
Then you can connect to you WSL environment using fully valid SSL certs.
You can also then expose the port on your LAN network. If setting the DNS to your LAN IP, you can easily share within the LAN.

# requirements

* access to a domain's DNS records
* understanding of how dehydrated works by the hypernode support docs.

# Generating SSL certificates

The `dns-hook.sh` script will pause and show you what TXT record to create. After validation it can be removed.

```bash
# first run only
dehydrated --register --accept-terms

# to generate / renew (after setting up domains in .dehydrayed/domains.txt)
dehydrated -c -k /data/web/.wsl/bin/dns-hook.sh -t dns-01
```

You will see something like below

```
Processing bla.fros.it
 + Creating new directory /data/web/certs/bla.fros.it ...
 + Signing domains...
 + Generating private key...
 + Generating signing request...
 + Requesting new certificate order from CA...
 + Received 1 authorizations URLs from the CA
 + Handling authorization for bla.fros.it
 + 1 pending challenge(s)
 + Deploying challenge tokens...
Add DNS record:
The Let's Encrypt certificate for bla.fros.it is about to expire.
Before it can be renewed, ownership of the domain must be proven by
responding to a challenge.

Please deploy the following record(s) to validate ownership of bla.fros.it:
  _acme-challenge.bla.fros.it. IN TXT hDKi3tJxA-9xouWrhzitEnGRgriBe63mZtAbuWhkCtM << Create this record
Set the env var: PUSHBULLET_ACCESS_TOKEN to enable pushes
 + Settling down for 10s...
```

After a few seconds, LE will check again and accept the challenge.

# Exposing on LAN

I myself always use something like *.wsl.frosit.nl for my WSL environments. If you point your DNS to your local IP, others within your LAN
can access it as well after forwarding the port in Windows. Usefull with mobile debugging etc.

```ps1
# change the ip at the end
netsh interface portproxy add v4tov4 listenport=443 listenaddress=0.0.0.0 connectport=443 connectaddress=192.168.1.12
```

# Issues

* multi domain cert does not work (@todo override nginx template)
* sometimes the nginx config doesn't reload well, run: `sudo nginx_config_reloader` and/or `/usr/bin/hypernode-ssl-config-generator`