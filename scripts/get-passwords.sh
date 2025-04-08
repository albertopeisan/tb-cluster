# Retrieve and decode the Argo CD admin password
ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
echo "Argo CD admin user password: $ARGOCD_PASSWORD"

# Retrieve clickhouse default user password
CLICKHOUSE_PASSWORD=$(kubectl -n clickhouse get secret clickhouse -o jsonpath="{.data.admin-password}" | base64 -d; echo)
echo "ClickHouse default user password: $CLICKHOUSE_PASSWORD"

# Retrieve and decode the Grafana admin password
GRAFANA_USER=$(kubectl -n grafana get secret grafana -o jsonpath="{.data.admin-user}" | base64 -d; echo)
echo "Grafana username: $GRAFANA_USER"
GRAFANA_PASSWORD=$(kubectl -n grafana get secret grafana -o jsonpath="{.data.admin-password}" | base64 -d; echo)
echo "Grafana password: $GRAFANA_PASSWORD"
