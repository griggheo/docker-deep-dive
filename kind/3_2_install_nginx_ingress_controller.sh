#!/bin/bash

# First make sure these lines are commented out in ingress-nginx-deploy.yaml:
        #      tolerations:
        #      - effect: NoSchedule
        #        key: node-role.kubernetes.io/master
        #        operator: Equal
        #      - effect: NoSchedule
        #        key: node-role.kubernetes.io/control-plane
        #        operator: Equal

	# After line:
  	#nodeSelector:
        #ingress-ready: "true"
kubectl apply -f ingress-nginx-deploy.yaml
