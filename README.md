# Linux Performance Testing Scripts
Simple scripts for Linux performance testing

Deploy VMs (if you don't have them yet)
```
az group create -n avnet1 -l eastus2
az group deployment create -g avnet1 --template-file arm-templates/vms-centos74.json
```
