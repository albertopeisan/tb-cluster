```bash
minikube start --cpus 4 --memory 4096 --disk-size 30g --nodes 5 --base-image docker.io/kicbase/stable:v0.0.46 -p tb-cluster
minikube addons enable ingress -p tb-cluster
minikube addons enable metrics-server -p tb-cluster
minikube profile tb-cluster
```
