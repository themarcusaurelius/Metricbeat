## Metricbeat - A lightweight shipper for system Metrics.

From CPU to memory, Redis to NGINX, and much much more, Metricbeat is a lightweight way to send system and service statistics to your Vizion Elastic app.

### Installation:

#### <b>Option 1.</b> Automated Installation.

### Windows:

1. As administrator, enter the following command in Powershell

```
Start-BitsTransfer -Source 'https://github.com/themarcusaurelius/windows-monitoring/archive/master.zip' -Destination 'C:\Users\Administrator\Downloads\windows-monitoring-master.zip'
```

2. Unzip the package and extract the contents to the `C:/` drive.

3. Open the extracted folder and double click on the `metricbeatInstall.exe`.

4. When prompted, enter your credentials below and click OK.

```css
Kibana URL: _PLACEHOLDER_KIBANA_URL_
Username: _PLACEHOLDER_USERNAME_
Password: _PLACEHOLDER_PASSWORD_
Elasticsearch API Endpoint: _PLACEHOLDER_API_ENDPOINT_
```

This will install and run metricbeat.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

### Linux:

1. Enter the following script into the console using elevated privileges

````CSS
curl https://olympus-io.github.io/vizion.ai/beat-install-scripts/install-config-metricbeat.sh > install-config-metricbeat.sh; chmod a+x  install-config-metricbeat.sh; ./install-config-metricbeat.sh _PLACEHOLDER_API_ENDPOINT_
````
    
2. When prompted, select the proper environment to complete the installation.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

#### <b>Option 2.</b> Manual Installation.

### Windows:

1. [Download Metricbeat.](https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-oss-6.5.4-windows-x86_64.zip)

    

2. Extract the contents of the zip file into the ```C:\``` drive.

3.  Rename the ```metricbeat-6.5.4-windows``` directory in the C:\ drive to ```Metricbeat```.

4. Open a PowerShell prompt as administrator and cd into the ```C:\``` drive.

5. Set the execution policy to be able to run the execution script. CD into the Metricbeat folder and run the following script:

```
 PowerShell.exe -ExecutionPolicy UnRestricted -File .\install-service-metricbeat.ps1
```

6. Configure the ```metricbeat.yml``` file with the correct Vizion.ai credentials.

<i>Tip: The easiest way to do this is to open the file up in a code editor such as Visual Studio Code.</i>

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

7. Test the ```metricbeat.yml``` configuration. In PowerShell, run the following script in the Metricbeat folder:

```
.\metricbeat.exe -e -configtest
```

8. Setup pre-configured Dashboards in Kibana.

```
.\metricbeat.exe setup --dashboards
```

9. Run the program in the foreground to make sure everything is setup:

```
 .\metricbeat.exe -c metricbeat.yml -e -d "*"
```

10. Once the config has been tested and runs without any ERROR messages, install ```Metricbeat``` as a service:

```
.\install-service-metricbeat.ps1
```

11. Test that ```Metricbeat``` has been installed as a service:

```
service metricbeat
```

12.  Start the ```Metricbeat``` service as a background process: 

```
start-service metricbeat
```

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

### Linux

1) Download and install Metricbeat by choosing your system.

  <b>Debian</b>

```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb
sudo dpkg -i metricbeat-7.6.1-amd64.deb
```

  <b>RPM</b>

```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-x86_64.rpm
sudo rpm -vi metricbeat-7.6.1-x86_64.rpm
```

  <b>Mac</b>

```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-darwin-x86_64.tar.gz
tar xzvf metricbeat-7.6.1-darwin-x86_64.tar.gz
```

  <b>Tar/Linux:<b/>

```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.5.4-linux-x86_64.tar.gz
tar xzvf filebeat-6.5.4-linux-x86_64.tar.gz
```

2) Configure Metricbeat. 

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

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**




















