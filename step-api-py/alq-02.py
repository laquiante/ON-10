#!/usr/bin/python3
# Verwendung nach hands-on # 07 


import requests

print ("Testing using requets and verifying the status code (expecting 200) ")

webserver = {
        "www1": "172.16.10.18",
        "www3": "172.16.10.28",
        "www4": "172.16.20.29"
}

for target in webserver:
        ergebnis = requests.get('http://'+webserver[target], auth=('user','pass'))
        if ergebnis.status_code == 200:
                print("webserver "+target+" is reachable, good job")
        else:
                print("webserver "+target+" is NOT reachable, please have a look")
