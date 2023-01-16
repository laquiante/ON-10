#!/bin/bash
# ex:ts=4:sw=4:sts=4:et
# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# ALQ, Hamburg JAN-2023
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
echo "  A) Host1 can not reach host2"
echo "  B) Host1 can not reach host2"
echo "  C)MLAG is broken"
echo "Layer3"
echo "EVPN"
echo " "
echo "===            end                ==="
echo

PS3='Please enter your choice: '
options=("L2 A" "L2 B" "L2 C" "L3" "EVPN" "Quit")
select opt in "${options[@]}"
do
    case $opt in
         "L2 A")
            echo "Troubleshooting based on MLAG setup"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-03/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/A/L1.yaml
            break
            ;;
        "L2 B")
            echo "Troubleshooting based on MLAG setup"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-03/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/B/L1.yaml
            break
            ;;
        "L2 C")
            echo "Troubleshooting based on MLAG setup"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-03/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer2/C/S3.yaml
            break
            ;;
         "Layer3")
            echo "Troubleshooting based on BGP unnumbered"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-04/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/layer3/A/L1.yaml
            break
            ;;
        "EVPN")
            echo "Troubleshooting based on EPVN-L3 Sym"
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-07/main.yaml
            ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./5th_day/evpn/A/L1.yaml
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
