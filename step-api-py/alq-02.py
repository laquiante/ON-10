#!/usr/bin/python3
# Verwendung nach hands-on # 07 


import requests

print ("Testing the EVPN-L3 fabric using requests and verifying the status code (expecting 200) ")

webserver = {
        "www1": "172.16.10.18",
        "www3": "172.16.10.28",
        "www4": "172.16.20.29"
}

for target in webserver:
        ergebnis = requests.get('http://'+webserver[target], auth=('user','pass'))
        if ergebnis.status_code == 200:
                print("webserver "+target+" is reachable via IP/TCP Port 80 on server host" +target[-1]+", good job")
        else:
                print("webserver "+target+" is NOT reachable, please have a look")
