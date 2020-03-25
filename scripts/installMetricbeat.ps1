##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2UbjQ3EtZ8CXvYqDwZK36+X8hyTMXZVZRFFjhCD/Bk68Tc4BVuccpMUCaRQkPOYK7r79HvO7TKEIl+JrJeCWo9I=
##Kc/BRM3KXxU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba

Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    "`nYou are running Powershell with full privilege`n"

    Set-Location -Path 'c:\metricbeat-master\metricbeat'
    Set-ExecutionPolicy Unrestricted
    
    "Metricbeat Execution policy set - Success`n"

    
    #=========== Metricbeat Credentials Form ===========#
    "`nAdding Metricbeat Credentials`n"


    #Opens up YML file and inserts Kibana URL
    (Get-Content metricbeat.yml) |
        ForEach-Object {$_ -Replace 'host: ""', "host: ""$($objTextBox.Text)"""} |
            Set-Content metricbeat.yml

    #Opens Up YML and sets Password
    (Get-Content metricbeat.yml) |       
        ForEach-Object {$_ -Replace 'password: ""', "password: ""$($objTextBox3.Text)""" } |
            Set-Content metricbeat.yml

    #Opens Up YML and sets Username
    (Get-Content metricbeat.yml) |       
        ForEach-Object {$_ -Replace 'username: ""', "username: ""$($objTextBox2.Text)""" } |
            Set-Content metricbeat.yml

    #Opens up YML file and inserts Elasticsearch API Endpoint
    (Get-Content metricbeat.yml) |
        ForEach-Object {$_ -Replace 'elasticsearch-api-endpoint', "$($objTextBox4.Text)"} |
            Set-Content metricbeat.yml

    #Runs the config test to make sure all data has been inputted correctly
    .\metricbeat.exe -e -configtest

    #Load Metricbeat Preconfigured Dashboards
    .\metricbeat.exe setup --dashboards

    #Install metricbeat as a service
    .\install-service-metricbeat.ps1

    #Runs metricbeat as a Service
    Start-service metricbeat

    #Show that metricbeat is running
    Get-Service metricbeat

    #Close Powershell window
    Stop-Process -Id $PID

}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}