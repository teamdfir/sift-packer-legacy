preflight-%:
	packer build -only=vmware-vmx -var="distro=$*" preflight.json

sift-%:
	packer build -only=vmware-vmx -var="distro=$*" sift.json
	sed -e 's/displayname.*/displayname = "SIFT Workstation"/' ./_virtuals/sift-$*.vmwarevm/sift-workstation.vmx > ./_virtuals/sift-$*.vmwarevm/sift-workstation.vmx.1
	rm ./_virtuals/sift-$*.vmwarevm/sift-workstation.vmx
	mv ./_virtuals/sift-$*.vmwarevm/sift-workstation.vmx.1 ./_virtuals/sift-$*.vmwarevm/sift-workstation.vmx

update-%:
	packer build -only=vmware-vmx -var="distro=$*" update.json
	sed -e 's/displayname.*/displayname = "SIFT Workstation"/' ./_virtuals/sift-update-$*.vmwarevm/sift-workstation.vmx > ./_virtuals/sift-update-$*.vmwarevm/sift-workstation.vmx.1
	rm ./_virtuals/sift-update-$*.vmwarevm/sift-workstation.vmx
	mv ./_virtuals/sift-update-$*.vmwarevm/sift-workstation.vmx.1 ./_virtuals/sift-update-$*.vmwarevm/sift-workstation.vmx

export-sift-%:
	/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool --acceptAllEulas ./_virtuals/sift-$*.vmwarevm/sift-workstation.vmx ./sift-$*.ova
	
export-update-%:
	/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool --acceptAllEulas ./_virtuals/sift-update-$*.vmwarevm/sift-workstation.vmx ./sift-update-$*.ova

aws-focal:
	packer build -only=amazon-ebs sift-aws.json