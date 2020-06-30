# Install Micro Services

In lab 01-install-consul we used the helm chart to install Consul.  Now
we are going to enable a sidecar process thats responsible with syncing Consul
with the service deployed into Kubernetes and enabling the Consul Connect Services



1. Create a file and place the following text into a file called change.yaml file.  This will enable syncCatalog and connectInject

```
syncCatalog:
  # True if you want to enable the catalog sync. Set to "-" to inherit from
  # global.enabled.
  enabled: true
  image: null
  default: true # true will sync by default, otherwise requires annotation

connectInject:
  enabled: true

proxyDefaults: |
{

  "envoy_prometheus_bind_addr": "udp://127.0.0.1:9125"

}
```

2. Execute a helm upgrade to redeloy the cluster with the updated value

Get the name of your release

```
helm list
```

Use the name from above to upgrade the release with the new value

```
helm upgrade consul hashicorp/consul -f change.yaml
```

You should see the following pod get created:

consul-sync-catalog

If the pod doesn't start, you should change the following attributes in values.yaml
and redeploy

```
hostNetwork: true
dnsPolicy: ClusterFirstWithHostNet

```

3. Deploy the counting and dashboard service

```
k apply -f .
```

4. View the services in the Consul UI dashboard.  Please run the command below to forward port 8080 to port 80 of the Consul UI.

```
k port-forward service/consul-consul-ui 8080:80
```

5. Open a browser and navigate to http://localhost:8080

6. (Optional) You can validate that the consul config was updated correctly by executing this:

```
consul config read -kind proxy-defaults -name global
```
