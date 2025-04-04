```bash
minikube start --cpus 4 --memory 2048 --disk-size 20g --nodes 5 --base-image docker.io/kicbase/stable:v0.0.46 -p tb-cluster
minikube profile tb-cluster
minikube addons enable ingress
minikube addons enable metrics-server
```
