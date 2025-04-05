#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Set the minikube profile
minikube profile tb-cluster

# Start minikube
minikube start -p tb-cluster

# Open the minikube dashboard URL
minikube dashboard --url -p tb-cluster &

# Namespaces to check for readiness
NAMESPACES=("argocd" "clickhouse" "prometheus" "grafana")

# Wait for all pods in each namespace to be ready
for NS in "${NAMESPACES[@]}"; do
  echo "Waiting for pods in namespace: $NS to be ready..."
  kubectl wait --namespace="$NS" --for=condition=Ready pods --all --timeout=300s
done

echo "All relevant pods are ready. Starting port forwarding..."

# Forward the port for Argo CD server
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Forward the port for Clickhouse server
kubectl port-forward -n clickhouse svc/clickhouse 8123:8123 &

# Forward the port for Prometheus server
kubectl port-forward -n prometheus svc/prometheus-server 9090:80 &

# Forward Grafana server service to respective local port
kubectl port-forward svc/grafana 3000:80 -n grafana &
