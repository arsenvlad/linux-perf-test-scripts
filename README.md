# Linux Performance Testing Scripts

Simple scripts for Linux performance testing

Deploy VMs (if you don't have them yet)

```bash
az group create -n avtest1 -l eastus2
az deployment group create -g avtest1 --template-file bicep-templates/vms.bicep
```
