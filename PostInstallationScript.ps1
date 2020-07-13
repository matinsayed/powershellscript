Install-WindowsFeature Web-WebServer, Web-Mgmt-Tools, Web-Mgmt-Console, Web-Basic-Auth, Web-Net-Ext, Web-Net-Ext45, Web-Asp-Net, Web-Asp-Net45, NET-Framework-Core, NET-HTTP-Activation, NET-Framework-45-ASPNET, NET-WCF-HTTP-Activation45, PowerShell, PowerShell-V2, WAS-Process-Model, WAS-NET-Environment, WAS-Config-APIs
New-NetFirewallRule -DisplayName 'Application_Port' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5005

$url = "https://github.com/deploymentfiles/powershellscript/raw/master/sqlncli.msi"
mkdir c:\sqlnative
cd c:\sqlnative
$output = "c:\sqlnative\sqlncli.msi"

Import-Module BitsTransfer

Start-BitsTransfer -Source $url -Destination $output
$client11Install = msiexec.exe /qn /i sqlncli.msi ADDLOCAL=ALL IACCEPTSQLNCLILICENSETERMS=YES /L*V C:\sqlnative\sqlNativeClientInstall.log