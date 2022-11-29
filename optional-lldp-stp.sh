#!/bin/bash
# ex:ts=4:sw=4:sts=4:et
# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# ALQ, Wittdün 2022
# 
# sudo ./r_unit-03

if [ -f /home/cumulus/ON-01/.additional.conf ]; then
        . /home/cumulus/ON-01/.additional.conf
fi

echo

echo
echo "===         description            ==="
echo
echo "preparing leaf1 and leaf2 with two connecitons"
echo "via swp5-6. This should result in one port blocking"
echo "Now you can verify if you receive via all ports"
echo "LLDP messages"

echo
echo "===            end                ==="

sudo ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./optional-lldp-stp/main.yaml
