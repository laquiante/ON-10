#!/bin/bash
# ex:ts=4:sw=4:sts=4:et
# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# ALQ, Hamburg 16-JAN-2023
# 
# sudo ./5th_day 

if [ -f /home/cumulus/ON-10/.additional.conf ]; then
        . /home/cumulus/ON-10/.additional.conf
fi
echo "===         description            ==="
echo
echo
echo " 5th day troubleshooting "
echo " "
echo "To be created over time:"
echo " "
echo "Layer2"
echo "  L2 A) Host1 (172.16.2.18) can not reach host2 (172.16.3.19)"
echo "  L2 B) Host1 (172.16.2.18) can not reach host2 (172.16.3.19)"
echo "  L2 C) MLAG is broken"
echo "  L2 D) Host1 (172.16.2.18) can not reach host3 (172.16.2.28)"
echo " "
echo "Layer3"
echo " L3 A) BGP is not receiving prefixes from the neighbors (spines)"
echo " L3 B) BGP is not sending prefixes to the neighbors (spines)"
echo " "
echo "EVPN"
echo " EVPN L2 A) Host1 (172.16.10.18) can not reach host3 (172.16.10.28)"
echo " EVPN L2 B) Host1 (172.16.10.18) can not reach host3 (172.16.10.28)" 
echo " EVPN L3 C) Host1 (172.16.10.18) can not reach host4 (172.16.20.29)"
echo "===            end                ==="
echo

PS3='Please enter your choice: '
options=("L2 A" "L2 B" "L2 C" "L2 D" "L3 A" "L3 B" "EVPN A" "EVPN B" "EVPN C" "Quit")
select opt in "${options[@]}"
do
    case $opt in
         "L2 A")
            echo "Troubleshooting based on MLAG setup"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-03/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/A/main.yaml
            break
            ;;
        "L2 B")
            echo "Troubleshooting based on MLAG setup"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-03/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/B/main.yaml
            break
            ;;
        "L2 C")
            echo "Troubleshooting based on MLAG setup"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-03/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/C/main.yaml
            break
            ;;
        "L2 D")
            echo "Troubleshooting based on simple L2 (trunks via spines)"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-02/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/D/main.yaml
            break
            ;;
         "L3 A")
            echo "Troubleshooting based on BGP unnumbered"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-04/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer3/A/main.yaml
            break
            ;;
         "L3 B")
            echo "Troubleshooting based on BGP unnumbered"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-04/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer3/B/main.yaml
            break
            ;;
        "EVPN A")
            echo "Troubleshooting based on EPVN-L2"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-05/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/evpn/A/main.yaml
            break
            ;;
        "EVPN B")
            echo "Troubleshooting based on EPVN-L2"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-05/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/evpn/B/main.yaml
            break
            ;;
        "EVPN C")
            echo "Troubleshooting based on EPVN-L3 Sym"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-06/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/evpn/C/main.yaml
            break
            ;;
        "Quit")
            break 
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
