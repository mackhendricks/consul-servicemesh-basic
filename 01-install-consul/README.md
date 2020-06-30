# Consul Helm Chart

This repository contains the official HashiCorp Helm chart for installing
and configuring Consul on Kubernetes. This chart supports multiple use
cases of Consul on Kubernetes depending on the values provided.

For full documentation on this Helm chart along with all the ways you can
use Consul with Kubernetes, please see the
[Consul and Kubernetes documentation](https://www.consul.io/docs/platform/k8s/index.html).

## Prerequisites

To use the charts here, [Helm](https://helm.sh/) must be installed in your
Kubernetes cluster. Setting up Kubernetes and Helm and is outside the scope
of this README. Please refer to the Kubernetes and Helm documentation.

The versions required are:

  * **Helm 2.10+** - This is the earliest version of Helm tested. It is possible
    it works with earlier versions but this chart is untested for those versions.
  * **Kubernetes 1.9+** - This is the earliest version of Kubernetes tested.
    It is possible that this chart works with earlier versions but it is
    untested. Other versions verified are Kubernetes 1.10, 1.11.

## Usage

To use the charts, you must add the Hashicorp helm repo

```
helm repo add hashicorp https://helm.releases.hashicorp.com
```

Ensure you have access to the consul chart:

```
$ helm search repo hashicorp/consul
```

Please see the many options supported in the `values.yaml`
file. These are also fully documented directly on the
[Consul website](https://www.consul.io/docs/platform/k8s/helm.html).

Get a List of Consul Chart Versions (which contains a version of Consul)

```
helm search repo hashicorp/consul -l
```

Install Consul

```
helm install consul hashicorp/consul --set global.name=consul
```

Note, you can add the "--version" parameter if you want to install a certain version
of the helm chart.  In my case, I wanted version 0.21.0 because it contains Consul 1.7.3.
Therefore, I used this command:

```
helm install consul hashicorp/consul --set global.name=consul --version 0.21.0
```
