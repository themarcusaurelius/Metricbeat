## Metricbeat - A lightweight shipper for system Metrics.

Metricbeat is a lightweight shipper for metric data, that will send system data and metrics to your Vizion Elastic app. [more](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-overview.html)
From CPU to memory, Redis to NGINX, and much much more, Metricbeat is a lightweight way to send system and service statistics.

### Installation:

- <b>Option 1)</b> Use automated plug-in scripts

##### Windows:

```css
Kibana URL: _PLACEHOLDER_KIBANA_URL_
Username: _PLACEHOLDER_USERNAME_
Password: _PLACEHOLDER_PASSWORD_
Elasticsearch API Endpoint: _PLACEHOLDER_API_ENDPOINT_
```

##### Mac & Linux:

To install and configure Metricbeat, enter the following into your console. Make sure you are using elevated privileges for the install.

````CSS
curl https://olympus-io.github.io/vizion.ai/beat-install-scripts/install-config-metricbeat.sh > install-config-metricbeat.sh; chmod a+x  install-config-metricbeat.sh; ./install-config-metricbeat.sh _PLACEHOLDER_API_ENDPOINT_
````
    
The installation script will prompt you to select the proper environment, then will install and complete the basic configuration automatically.

To enable a module, enter `metricbeat modules enable << module name >>` or `./metricbeat modules enable << module name >>`

Modules available: *Aerospike, Apache, Ceph, Couchbase, Docker, Dropwizard, Elasticsearch, envoyproxy, Etcd, Golang, Graphite, HAProxy, HTTP, Jolokia, Kafka, Kibana, Kubernetes, kvm, Logstash, Memcached, MongoDB, Munin, MySQL, Nginx, PHP_FPM, PostgreSQL, Prometheus, RabbitMQ, Redis, System, traefik, uwsgi, vSphere, Windows, ZooKeeper*

[More on Metricbeat modules](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html)

**You should now be sending data to your Vizion Elastic app. View it in [Kibana](https://app.vizion.ai/app/kibana)**

For debugging, you can view your Metricbeat error logs at `/var/log/metricbeat/metricbeat` or change the configuration at `/etc/metricbeat/metricbeat.yml`.

- <b>Option 2)</b> Download and install beats manually




