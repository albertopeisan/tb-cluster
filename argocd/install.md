Create namespace and deploy argocd.

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd -n argocd --create-namespace --version 7.8.23
```

Wait until the argocd deployment is running and port-forward traffic.

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Update the admin password.

```bash
argocd login localhost:8080 --insecure --username admin
argocd account update-password --account admin --current-password <current-password> --new-password <new-password>
```