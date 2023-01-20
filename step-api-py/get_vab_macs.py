#!/usr/bin/python3
# alq, Hamburg, den 09.04.2022
# modified 20.01.2023
# python3 -m pip instal -U prettytable

try:
    from paramiko import SSHClient, AutoAddPolicy
    from prettytable import PrettyTable
except ImportError:
    print ("Required Module(s) not available")
    sys.exit()

# Konstanten

SWITCH = "192.168.200.4"
VAB = "br_default"
HKEY = '/home/cumulus/.ssh/known_hosts'
BENUTZER = "cumulus"
NODE  = ["192.168.200.2","192.168.200.3","192.168.200.4","192.168.200.5"]
HOST  = ["192.168.200.6","192.168.200.7","192.168.200.8","192.168.200.9"]
DEBUG = 0
INFO  = 0

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def via_ssh(kommando,ziel):
    client = SSHClient()
    client.load_host_keys(HKEY)
    client.load_system_host_keys()
    client.set_missing_host_key_policy(AutoAddPolicy())
    client.connect(ziel, username=BENUTZER)
    stdin, stdout, stderr = client.exec_command(kommando)
    ergebnis = stdout.read().decode("utf8")
    stdin.close()
    stdout.close()
    stderr.close()
    client.close()
    return  ergebnis

def test_reachbility(ziel):
        for n in ziel:
            answer = os.popen(f"ping -c 2 {n}").read()
            if "Received = 2" or "Received = 1":
                print(f"{n} reachable via OOB")
            else:
                print(f"{n} not reachable via OOB")
        print("\n")

def verify_lab():
        print("Verifying if Switches and Hosts are reachable")
        test_reachability(NODE)
        test_reachability(HOST)
        
def get_host_prod_mac(ziel):
        erg = via_ssh("ip -br l",ziel)
        if_line = erg.splitlines()

        for j in range (0,len(if_line)):
                if_line_item = if_line[j].split()
                if  if_line_item [0] == "eth2":
                        print(" -> | "+i+ "(oob-network) : "+if_line_item[2])
                        erg_ip = via_ssh("ip -br a",ziel)
#                       if_line_ip = erg_ip.splitlines()
#                       print("    | "+if_line_ip[j].split()[2])


def get_nos(ziel)
        for i in ziel:
                ergebnis = requests.get('https://'+i+':8765/cue_v1/system', auth=('cumulus','Academy123'), verify=False)
                print (ergebnis.json())

if INFO:
        print("Assumption eth0 if present connects to the oob-network")
        print("More precise verify if eth0 is L3 and if eth0 subnet equates to the oob-network subnet")


print("Looking for production interfaces on hosts(LTS 20.05). Found:")
for i in HOST:
        get_host_prod_mac(i)

#       erg = via_ssh("ip -br l",i)
#       if_line = erg.splitlines()

#       for j in range (0,len(if_line)):
#               if_line_item = if_line[j].split()
#               if  if_line_item [0] == "eth2":
#                       print(" -> | "+i+ "(oob-network) : "+if_line_item[2])



# main
verfiy_lab()

if INFO:
        get_nos(NODE)


