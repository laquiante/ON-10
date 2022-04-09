#!/usr/bin/python3

import requests

print ("Testing using requets and verifying the status code (expecting 200) ")

webserver = {
        "www1": "172.16.2.18",
        "www2": "172.16.3.19",
        "www3": "172.16.2.28",
        "www4": "172.16.3.29"
}

for target in webserver:
        ergebnis = requests.get('http://'+webserver[target], auth=('user','pass'))
        if ergebnis.status_code == 200:
                print("webserver "+target+" is reachable, good job")
        else:
                print("webserver "+target+" is NOT reachable, please have a look")
