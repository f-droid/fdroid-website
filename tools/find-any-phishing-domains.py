#!/usr/bin/env python3
#
# https://en.wikipedia.org/wiki/IDN_homograph_attack

import requests
import socket
from concurrent.futures import ThreadPoolExecutor

def query(domain):
    # TODO this should first do a whois request to see if the domain
    # has an active registration and nameservers
    try:
        socket.getaddrinfo(domain, 80)
        print(domain, flush=True)
    except socket.gaierror as e:
        pass

# these chars are either ASCII or unicode literals
Fs = ['f']
_s = ['-', '']
Ds = ['d']
Rs = ['r', '\u0280']
Os = ['o', '0', '\u043E', '\u028A']
Is = ['i', '1', 'l', '\u0131', '\u0456', '\u0269', '\u0268']

tlds = ['org', 'net', 'network', 'com', 'co', 'cc']

# this gives all TLDs.  Careful, some TLDs return DNS results for unregistered domains
#url = 'https://raw.githubusercontent.com/incognico/list-of-top-level-domains/master/formats/json/tld-list.json'
#r = requests.get(url)
#r.raise_for_status()
#tlds = r.json()

domains = set()
for tld in tlds:
    for _ in _s:
        for f in Fs:
            for d in Ds:
                for r in Rs:
                    for o in Os:
                        for i in Is:
                            domains.add(f + _ + d + r + o + i + d + '.' + tld)

with ThreadPoolExecutor(max_workers=20) as executor:
    for domain in sorted(domains):
        future = executor.submit(query, domain)
