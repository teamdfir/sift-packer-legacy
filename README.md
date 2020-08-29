![Logo](https://digital-forensics.sans.org/images/sift.png)

# SIFT Packer Scripts

These scripts build out the community SIFT ova file.

**Notice:** this is for advanced users, docs might not always be up-to-date.

## VMWare

All this building and testing and development has been done with VMWare Fusion, it should work with workstation, but has not been tested.

For best results, its best to first create a machine and install ubuntu 16.04 manually or using the easy install, after that you can use all the build scripts to build the VM.

**Note:** You might have to remove the scsi entries in the .vmx file around the cd-rom and auto detect with the first base vm you initial create, it can cause problems with packer and there is a bug open for it.

### Step 1. Create Base VM

You only need to do this step once. If you use easy install, set the username to `sansforensics` and password to `forensics`. Once everything is installed, you'll want to login and install openssh-server, after that, you can shutdown and exit the VM, you will not need to come back to it.

```bash
sudo apt-get install -y openssh-server
```

### Step 2. Preflight VM

The reason for the preflight VM is simply to make doing builds easier and more consistent in the long run. There is less work that the step 3 has to do, and if step 3 fails for whatever reason, you do not have to start back over at square one.

This is a VM that installs all the base requirements without installing SIFT.

```bash
packer build -only=vmware-vmx preflight.json
```
OR
```bash
make preflight
```

### Step 3. SIFT VM

This takes the preflight VM and turns it into SIFT.

```bash
packer build -only=vmware-vmx sift.json
```
OR 
```bash
make sift
```

### Update SIFT VM

This takes the SIFT VMX and runs the SIFT scripts to build an updated VM.

```bash
packer build -only=vmware-vmx update.json
```
OR
```bash
make update
```

### Export to OVA

This assumes you are on OSX with vmware fusion installed
```bash
make export
```

## AWS

Unlike the VMWare and desktop mode build, the AWS build is a server only. In this configuration we do not need to build any base or preflight images ahead of time.

```bash
make sift-aws
```