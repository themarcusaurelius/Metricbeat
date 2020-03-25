## Metricbeat - A lightweight shipper for system Metrics.

Metricbeat is a lightweight shipper for metric data, that will send system data and metrics to your Vizion Elastic app. [more](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-overview.html)
From CPU to memory, Redis to NGINX, and much much more, Metricbeat is a lightweight way to send system and service statistics.

### Installation:

- <b>Option 1)</b> Use automated plug-in scripts.

##### Windows:

```css
Kibana URL: _PLACEHOLDER_KIBANA_URL_
Username: _PLACEHOLDER_USERNAME_
Password: _PLACEHOLDER_PASSWORD_
Elasticsearch API Endpoint: _PLACEHOLDER_API_ENDPOINT_
```

##### Linux:

To install and configure Metricbeat, enter the following into your console. Make sure you are using elevated privileges for the install.

````CSS
curl https://olympus-io.github.io/vizion.ai/beat-install-scripts/install-config-metricbeat.sh > install-config-metricbeat.sh; chmod a+x  install-config-metricbeat.sh; ./install-config-metricbeat.sh _PLACEHOLDER_API_ENDPOINT_
````
    
The installation script will prompt you to select the proper environment, then will install and complete the basic configuration automatically.

**You should now be sending data to your Vizion Elastic app. View it in [Kibana](https://app.vizion.ai/app/kibana)**

For debugging, you can view your Metricbeat error logs at `/var/log/metricbeat/metricbeat` or change the configuration at `/etc/metricbeat/metricbeat.yml`.

<br>

- <b>Option 2)</b> Download and install beats manually.

##### Windows:

##### Linux

1) Download and install Metricbeat.

```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.5.4-linux-x86_64.tar.gz
tar xzvf filebeat-6.5.4-linux-x86_64.tar.gz
```

2) Configure Metricbeat

Open the ```metricbeat.yml```.

```
sudo vi /etc/metricbeat/metricbeat.yml
```

Add the proper credentials to the Kibana and Elasticsearch sections of the ```metricbeat.yml``` file. 

<b>Kibana:</b>

```
setup.kibana
  host: "_PLACEHOLDER_KIBANA_URL_"
  username: "_PLACEHOLDER_USERNAME_"
  password: "_PLACEHOLDER_PASSWORD_"
```

<b>Elasticsearch Output:</b>

```
output.elasticsearch
  hosts: ["_PLACEHOLDER_API_ENDPOINT_"]
```

3. Test the configuration:

Change to the directory where the Metricbeat binary is installed, and run Metricbeat in the foreground with the following options specified:

```
metricbeat test config -e
```

If you do not see any ERROR messages, than the configuration is correct.

4. Set up the Kibana Dashboards:

```
metricbeat setup --dashboards
```

5. Start Metricbeat

```
service metricbeat start
```




















