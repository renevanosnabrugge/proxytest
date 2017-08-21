# Define a proxy
Configuration Proxy {
        Registry ProxyPerMachinePolicy
        {
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings'
            ValueName = 'ProxySettingsPerUser'
            Ensure = 'Present'
            ValueData = '0'
            ValueType = 'Dword'
            Force = $true
        }
        Registry ProxyPerMachineWinHttPSettings 
        {
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections'
            ValueName = 'WinHttPSettings'
            Ensure = 'Absent'
            Force = $true
        }
        Registry ProxyPerMachineDefaultConnectionSettings
        {
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections'
            ValueName = 'DefaultConnectionSettings'
            Ensure = 'Present'
            ValueType = 'Binary'
            ValueData = '460000000300000003000000110000006D7970726F78792E6671646E3A38383838070000003C6C6F63616C3E000000000000000000000000000000000000000000000000000000000000000000000000'
            Force = $true
        }
        Registry ProxyPerMachineSavedLegacySettings
        {
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections'
            ValueName = 'SavedLegacySettings'
            Ensure = 'Present'
            ValueType = 'Binary'
            ValueData = '460000000800000003000000110000006D7970726F78792E6671646E3A38383838070000003C6C6F63616C3E000000000000000000000000000000000000000000000000000000000000000000000000'
            Force = $true
        }
        Registry ProxyPerMachineProxyEnable
        {        
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
            ValueName = 'ProxyEnable'
            Ensure = 'Present'
            ValueData = '1'
            ValueType = 'Dword'
            Force = $true
        }
        Registry ProxyPerMachineProxyServer
        {        
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
            ValueName = 'ProxyServer'
            Ensure = 'Present'
            ValueData = 'RALPH.fqdn:8888'
            ValueType = 'String'
            Force = $true
        }
        Registry ProxyPerMachineProxyOverride
        {
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
            ValueName = 'ProxyOverride'
            Ensure = 'Present'
            Force = $true
            ValueData = '<local>'
            ValueType = 'String'
        }
        Registry ProxyPerMachineAutoConfigURL
        {
            Key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
            ValueName = 'AutoConfigURL'
            Ensure = 'Absent'
            Force = $true
        }
        Registry ProxyPerMachineLockAutoConfig
        {
            Key = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Control Panel'
            ValueName = 'Autoconfig'
            Ensure = 'Present'
            ValueData = '1'
            ValueType = 'Dword'
            Force = $true
        }
        Registry ProxyPerMachineLockProxy
        {
            Key = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Control Panel'
            ValueName = 'Proxy'
            Ensure = 'Present'
            ValueData = '1'
            ValueType = 'Dword'
            Force = $true
        }
}

Proxy
Start-DscConfiguration .\Proxy -Wait -Verbose