#!/bin/bash

# Set the minikube profile
minikube profile tb-cluster

# Start minikube
minikube start

# Open the minikube dashboard URL
minikube dashboard --url &

# Forward the port for Argo CD server
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Forward the port for Clickhouse server
kubectl port-forward -n clickhouse svc/clickhouse 8123:8123 &

# Forward the port for Prometheus server
kubectl port-forward -n prometheus svc/prometheus-server 9090:80 &