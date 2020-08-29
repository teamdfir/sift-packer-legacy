#!/bin/bash

cat << EOF > /etc/cloud/cloud.cfg.d/defaults.cfg
#cloud-config
system_info:
  default_user:
    name: sansforensics
EOF