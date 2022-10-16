#!/bin/bash

sudo snap install microk8s --classic

# firewall rules
sudo ufw allow in on cni0 && sudo ufw allow out on cni0
sudo ufw default allow routed

# enable addons
sudo microk8s enable dns dashboard storage ingress registry

# grant access to ubuntu so we can run without sudo
sudo chown -R root:ubuntu /var/snap/microk8s/

#If RBAC is not enabled access the dashboard using the token retrieved with:
#microk8s kubectl describe secret -n kube-system microk8s-dashboard-token
#Use this token in the https login UI of the kubernetes-dashboard service.
#In an RBAC enabled setup (microk8s enable RBAC) you need to create a user with restricted
#permissions as shown in:
#https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

# calico pod crashing
microk8s kubectl get ippools.crd.projectcalico.org default-ipv4-ippool
# then
# microk8s kubectl edit ippools.crd.projectcalico.org default-ipv4-ippool
# and set
# vxlanMode: Never
