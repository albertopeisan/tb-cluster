# Forward the port for Argo CD server
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Forward the port for Clickhouse server
kubectl port-forward -n clickhouse svc/clickhouse 8123:8123 &

# Forward the port for Prometheus server
kubectl port-forward -n prometheus svc/prometheus-server 9090:80 &

# Forward Grafana server service to respective local port
kubectl port-forward svc/grafana 3000:80 -n grafana &