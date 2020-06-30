#!/bin/bash

install() {
# Add Stable Repo for Standard Charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com

# Add Repo for Hashicorp Products
helm repo add hashicorp https://helm.releases.hashicorp.com

# Install Consul and apply the Values needed
helm install consul hashicorp/consul --set global.name=consul --version 0.21.0 -f consul.yaml


# Install Prometheus
helm install prometheus stable/prometheus --set global.name=prometheus

# Install Granfana
helm install grafana stable/grafana --set global.name=grafana

# Get Password for Granfana UI
grafana_password=`kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`

#Deploy Services
deployServices

# Output the manual steps needed

PROM_SERVER=`kubectl get service prometheus-server -o jsonpath='{.spec.clusterIP}'`
echo "Next Steps\n==========\n"
echo "Please connect to the Grafana Service via: kubectl port-forward service/grafana 9091:80 and login using admin / $grafana_password"
echo "Setup the datasource to be $PROM_SERVER and import the api_requests_dashboard.json located in this folder"
echo "Now try to access the Dashboard service located at: kubectl port-forward service/dashboard-service 9092:80"
}

deployServices() {

kubectl apply -f ../04-install-micro-services/
}

uninstall() { 

helm uninstall grafana
helm uninstall prometheus
helm uninstall consul
kubectl delete service,pod counting-service dashboard-service

}

if [[ "$1" == "uninstall" ]]; then
	uninstall
	exit
fi

if [[ "$1" == "install" ]]; then

	install
fi
