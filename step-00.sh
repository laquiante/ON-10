#sudo ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-00/prepare_cue.yaml
#sudo ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-00/prepare_leafs.yaml
#sudo ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-00/prepare_hosts.yaml
sudo ansible-playbook -i /home/cumulus/ON-10/inventory/files/hosts ./step-00/main.yaml
