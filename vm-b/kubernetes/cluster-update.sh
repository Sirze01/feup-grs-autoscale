#! /bin/bash

# Update traefik
helm upgrade --install traefik traefik/traefik --values config/traefik-values.yaml

# Update prometheus
helm upgrade --install prometheus prometheus-community/prometheus --values config/prometheus-values.yaml

# Update grafana
helm upgrade --install grafana grafana/grafana --values config/grafana-values.yaml
