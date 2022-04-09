#!/usr/bin/python3
# alq, Hamburg, den 09.04.2022


import requests
import urllib3
from prettytable import PrettyTable

SWITCH = "172.16.2.254"
VAB = "br_default"

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

ergebnis = requests.get('https://'+SWITCH+':8765/cue_v1/bridge/domain/br_default/mac-table', auth=('cumulus','Academy123'), verfiy=False)

myTable=PrettyTable([SWITCH,VAB,"MAC"])
for key in  ergebnis.json():
        for sub_key in  ergebnis.json()[key]:
                if sub_key == "mac":
                        myTable.add_row([" "," ",ergebnis.json()[key][sub_key]])
print(myTable)
