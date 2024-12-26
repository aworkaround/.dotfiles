location='centralindia'
rg='Win11-VM-RG'
name='Win11-VM'
dnsname='win11-demo-vm01'
adminpassword='asd62c6bdb3bfc0c82959a'

az group create --name $rg --location $location >/dev/null

az vm create --name $name \
  --resource-group $rg \
  --admin-username 'admin' \
  --admin-password $adminpassword \
  --authentication-type 'password' \
  --computer-name 'devcrypted' \
  --license-type 'Windows_Client' \
  --location $location \
  --nsg-rule 'RDP' \
  --os-disk-caching 'ReadWrite' \
  --os-disk-delete-option 'Delete' \
  --os-disk-name "$name-osdisk" \
  --os-disk-size-gb '40' \
  --image 'MicrosoftWindowsDesktop:windows-11:win11-21h2-pro-zh-cn:22000.1100.221015' \
  --public-ip-address-dns-name $dnsname \
  --size 'Standard_D2ads_v5' \
  --ultra-ssd-enabled true
