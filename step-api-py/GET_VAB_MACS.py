#!/usr/bin/python3
# alq, Hamburg, den 09.04.2022


import requests
import ast
import urllib3

SWITCH = "172.16.2.254"
VAB = "br_default"

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

ergebnis = requests.get('https://'+SWITCH+':8765/cue_v1/bridge/domain/br_default/mac-table', auth=('cumulus','Academy123'), verify=False)

print("Die VAB "+VAB+" innerhalb von "+SWITCH+" hat folgende Adressen gelernt")
for key in  ergebnis.json():
        for sub_key in  ergebnis.json()[key]:
                if sub_key == "mac":
                        print(ergebnis.json()[key][sub_key])
