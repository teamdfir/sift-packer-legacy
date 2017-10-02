.PHONY: build-vmware build-vbox update-vmware update-vbox

preflight:
	packer build -only=vmware-vmx preflight.json

build:
	packer build -only=vmware-vmx sift.json

update:
	packer build -only=vmware-vmx update.json
	
export-build:
	/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool --acceptAllEulas ./_virtuals/sift.vmwarevm/sift-workstation.vmx ./sift.ova
	
export-update:
	/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool --acceptAllEulas ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx ./sift-update.ova
