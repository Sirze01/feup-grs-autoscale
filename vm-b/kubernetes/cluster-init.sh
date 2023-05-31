#! /bin/bash

# Add all helm repos and update
helm repo add traefik https://traefik.github.io/charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add kedacore https://kedacore.github.io/charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Create cluster
kind create cluster --config config/kind-config.yaml --wait 1m

# Install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml
kubectl wait --namespace metallb-system --for=condition=ready pod --selector=app=metallb --timeout=90s
kubectl apply -f config/metallb-config.yaml


# Install traefik
helm install traefik traefik/traefik --values config/traefik-values.yaml

# Install prometheus
helm install prometheus prometheus-community/prometheus
kubectl expose service prometheus-server --type=LoadBalancer --target-port=9090 --name=prometheus-server-ext

# Install keda
helm install keda kedacore/keda

# Install grafana
helm install grafana grafana/grafana --values config/grafana-values.yaml


sleep 2m
helm upgrade --install prometheus prometheus-community/prometheus --values config/prometheus-values.yaml