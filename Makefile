.PHONY: build-vmware build-vbox update-vmware update-vbox

preflight:
	packer build -only=vmware-vmx preflight.json

sift:
	packer build -only=vmware-vmx sift.json
	sed -e 's/displayname.*/displayname = "SIFT Workstation"/' ./_virtuals/sift.vmwarevm/sift-workstation.vmx > ./_virtuals/sift.vmwarevm/sift-workstation.vmx.1
	rm ./_virtuals/sift.vmwarevm/sift-workstation.vmx
	mv ./_virtuals/sift.vmwarevm/sift-workstation.vmx.1 ./_virtuals/sift.vmwarevm/sift-workstation.vmx

update:
	packer build -only=vmware-vmx update.json
	sed -e 's/displayname.*/displayname = "SIFT Workstation"/' ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx > ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx.1
	rm ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx
	mv ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx.1 ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx
	
export-build:
	/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool --acceptAllEulas ./_virtuals/sift.vmwarevm/sift-workstation.vmx ./sift.ova
	
export-update:
	/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool --acceptAllEulas ./_virtuals/sift-update.vmwarevm/sift-workstation.vmx ./sift-update.ova

build-export: build export-build

update-export: update export-update
