
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    #Change Directory to metricbeat
    Set-Location -Path 'c:\metricbeat-master\metribeat'

    #Stops metricbeat from running
    Stop-Service -Force metricbeat

    #Get The metricbeat Status
    Get-Service metricbeat

    #Change Directory to metricbeat5
    Set-Location -Path 'c:\'

    'Uninstalling metricbeat Now...'

    $Target = "C:\metricbeat-master"

    Get-ChildItem -Path $Target -Recurse -force |
        Where-Object { -not ($_.pscontainer)} |
            Remove-Item -Force -Recurse

    Remove-Item -Recurse -Force $Target
}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}