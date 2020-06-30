# Lab 01, Exercise 05: Configure Grafana

**Objective:** Configure Grafana for use with Prometheus

## Step 1: Add Prometheus data source

Go to the **Grafana** tab and login if you haven't already. The default user/password is **admin/admin**.

You should see the Home Dashboard:

![Grafana home](../../images/lab01-grafana-home.png "Grafana home")

Click **Add data source** and then select **Prometheus** on the following screen.

![Add data source](../../images/lab01-grafana-add-data-source.png "Grafana add data source")

Obtain the cluster ip of the Prometheus services by doing:

```
k get services
```

![](../../images/lab-03-prometheus-service.png)

The **HTTP URL** in my environment would be `http://10.245.37.21:9090`.  
Locate the IP address of your Prometheus server and enter that.  The name of
your Prometheus data source might be Prometheus-1 since the default data source
is called Promethus

![Configure Prometheus data source in Grafana](../../images/lab-03-configure-grafana-using-k8s.png "Configure Prometheus data source in Grafana")

Click **Save & Test**.
