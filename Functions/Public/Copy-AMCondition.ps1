function Copy-AMCondition {
    <#
        .SYNOPSIS
            Copies an Automate condition.

        .DESCRIPTION
            Copy-AMCondition can copy a condition object within, or between servers.

        .PARAMETER InputObject
            The object to copy.

        .PARAMETER Name
            The new name to set on the object.

        .PARAMETER Folder
            The folder to place the object in.

        .PARAMETER Connection
            The server to copy the object to.

        .INPUTS
            The following Automate object types can be modified by this function:
            Condition

        .OUTPUTS
            Condition

        .EXAMPLE
            # Copy condition "Daily at 12:00PM" from server1 to server2
            Get-AMCondition "Daily at 12:00PM" -Connection server1 | Copy-AMCondition -Folder (Get-AMFolder CONDITIONS -Connection server2) -Connection server2

        .LINK
            https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Copy-AMCondition.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        $InputObject,

        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [ValidateScript({$_.Type -eq "Folder"})]
        $Folder,

        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter([AMConnectionCompleter])]
        $Connection
    )

    BEGIN {
        if ($PSBoundParameters.ContainsKey("Connection")) {
            $Connection = Get-AMConnection -Connection $Connection
            if (($Connection | Measure-Object).Count -eq 0) {
                throw "No Automate server specified!"
            } elseif (($Connection | Measure-Object).Count -gt 1) {
                throw "Multiple Automate servers specified, please specify one server to copy the condition to!"
            }
        }

        Write-Verbose "Caching condition IDs for server $($Connection.Alias) for ID checking"
        $conditionCache = Get-AMCondition -Connection $Connection
        $existingIds = @()
        $existingIds += $conditionCache.ID
        $existingIds += $conditionCache.Credentials.ID # SNMP condition credential IDs
        $existingIds += $conditionCache.WindowControl.ID # Window condition control IDs
    }

    PROCESS {
        foreach ($obj in $InputObject) {
            if ($obj.Type -eq "Condition") {
                if ($PSBoundParameters.ContainsKey("Connection")) {
                    # Copy from one Automate server to another
                    if ($obj.ConnectionAlias -ne $Connection.Alias) {
                        if ($PSBoundParameters.ContainsKey("Folder")) {
                            if ($Folder.ConnectionAlias -ne $Connection.Alias) {
                                throw "Folder specified exists on $($Folder.ConnectionAlias), the folder must exist on $($Connection.Name)!"
                            }
                        } else {
                            $Folder = Get-AMDefaultFolder -Connection $Connection -Type CONDITIONS
                        }
                    }
                } else {
                    $Connection = Get-AMConnection -ConnectionAlias $obj.ConnectionAlias
                    if (-not $PSBoundParameters.ContainsKey("Folder")) {
                        $Folder = Get-AMFolder -ID $obj.ParentID -Connection $obj.ConnectionAlias
                    }
                }

                if (-not $PSBoundParameters.ContainsKey("Name")) { $Name = $obj.Name }
                $excludedProperties = @()
                $currentObject = Get-AMCondition -ID $obj.ID -Connection $obj.ConnectionAlias
                switch ($Connection.Version.Major) {
                    10 {
                        switch ($obj.TriggerType) {
                            "Database"    { $copyObject = [AMDatabaseTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "EventLog"    { $copyObject = [AMEventLogTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "FileSystem"  { $copyObject = [AMFileSystemTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Idle"        { $copyObject = [AMIdleTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Keyboard"    { $copyObject = [AMKeyboardTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Logon"       { $copyObject = [AMLogonTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Performance" { $copyObject = [AMPerformanceTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Process"     { $copyObject = [AMProcessTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Schedule"    { $copyObject = [AMScheduleTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "Service"     { $copyObject = [AMServiceTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "SharePoint"  { $copyObject = [AMSharePointTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            "SNMPTrap"    {
                                $copyObject = [AMSNMPTriggerv10]::new($Name, $Folder, $Connection.Alias)
                                foreach ($credential in $currentObject.Credentials) {
                                    $copyCredential = [AMSNMPTriggerCredentialv10]::new()
                                    $copyCredential.AuthenticationPassword = $credential.AuthenticationPassword
                                    $copyCredential.EncryptionAlgorithm    = $credential.EncryptionAlgorithm
                                    $copyCredential.PrivacyPassword        = $credential.PrivacyPassword
                                    $copyCredential.User                   = $credential.User
                                    if ($obj.ConnectionAlias -ne $Connection.Alias -and $credential.ID -notin $existingIds) {
                                        $copyCredential.ID = $credential.ID
                                    }
                                    $copyObject.Credentials.Add($copyCredential) | Out-Null
                                }
                                $excludedProperties += "Credentials"
                            }
                            "Window"      {
                                $copyObject = [AMWindowTriggerv10]::new($Name, $Folder, $Connection.Alias)
                                foreach ($control in $currentObject.WindowControl) {
                                    $copyControl = [AMWindowTriggerControlv10]::new()
                                    $copyControl.Name          = $control.Name
                                    $copyControl.Class         = $control.Class
                                    $copyControl.Value         = $control.Value
                                    $copyControl.Type          = $control.Type
                                    $copyControl.Xpos          = $control.Xpos
                                    $copyControl.Ypos          = $control.Ypos
                                    $copyControl.CheckName     = $control.CheckName
                                    $copyControl.CheckClass    = $control.CheckClass
                                    $copyControl.CheckValue    = $control.CheckValue
                                    $copyControl.CheckType     = $control.CheckType
                                    $copyControl.CheckPosition = $control.CheckPosition
                                    if ($obj.ConnectionAlias -ne $Connection.Alias -and $control.ID -notin $existingIds) {
                                        $copyControl.ID = $control.ID
                                    }
                                    $copyObject.WindowControl.Add($copyControl) | Out-Null
                                }
                                $excludedProperties += "WindowControl"
                            }
                            "WMI"         { $copyObject = [AMWMITriggerv10]::new($Name, $Folder, $Connection.Alias) }
                            default       { throw "Unsupported trigger type '$($obj.TriggerType)' encountered!" }
                        }
                    }
                    {$_ -in 11,22,23,24} {
                        switch ($obj.TriggerType) {
                            "Database"    { $copyObject = [AMDatabaseTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Email"       {
                                $copyObject = [AMEmailTriggerv11]::new($Name, $Folder, $Connection.Alias)
                                foreach ($emailFilter in $currentObject.EmailFilters) {
                                    $copyEmailFilter = [AMEmailFilterv11]::new($copyObject)
                                    $copyEmailFilter.FieldName  = $emailFilter.FieldName
                                    $copyEmailFilter.FieldValue = $emailFilter.FieldValue
                                    $copyEmailFilter.Operator   = $emailFilter.Operator
                                    $copyObject.EmailFilters.Add($copyEmailFilter)
                                }
                                $excludedProperties += "EmailFilters"
                            }
                            "EventLog"    { $copyObject = [AMEventLogTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "FileSystem"  { $copyObject = [AMFileSystemTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Idle"        { $copyObject = [AMIdleTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Keyboard"    { $copyObject = [AMKeyboardTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Logon"       { $copyObject = [AMLogonTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Performance" { $copyObject = [AMPerformanceTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Process"     { $copyObject = [AMProcessTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Schedule"    { $copyObject = [AMScheduleTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "Service"     { $copyObject = [AMServiceTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "SharePoint"  { $copyObject = [AMSharePointTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            "SNMPTrap"    {
                                $copyObject = [AMSNMPTriggerv11]::new($Name, $Folder, $Connection.Alias)
                                foreach ($credential in $currentObject.Credentials) {
                                    $copyCredential = [AMSNMPTriggerCredentialv11]::new()
                                    $copyCredential.AuthenticationPassword = $credential.AuthenticationPassword
                                    $copyCredential.EncryptionAlgorithm    = $credential.EncryptionAlgorithm
                                    $copyCredential.PrivacyPassword        = $credential.PrivacyPassword
                                    $copyCredential.User                   = $credential.User
                                    if ($obj.ConnectionAlias -ne $Connection.Alias -and $credential.ID -notin $existingIds) {
                                        $copyCredential.ID = $credential.ID
                                    }
                                    $copyObject.Credentials.Add($copyCredential) | Out-Null
                                }
                                $excludedProperties += "Credentials"
                            }
                            "Window"      {
                                $copyObject = [AMWindowTriggerv11]::new($Name, $Folder, $Connection.Alias)
                                foreach ($control in $currentObject.WindowControl) {
                                    $copyControl = [AMWindowTriggerControlv11]::new()
                                    $copyControl.Name          = $control.Name
                                    $copyControl.Class         = $control.Class
                                    $copyControl.Value         = $control.Value
                                    $copyControl.Type          = $control.Type
                                    $copyControl.Xpos          = $control.Xpos
                                    $copyControl.Ypos          = $control.Ypos
                                    $copyControl.CheckName     = $control.CheckName
                                    $copyControl.CheckClass    = $control.CheckClass
                                    $copyControl.CheckValue    = $control.CheckValue
                                    $copyControl.CheckType     = $control.CheckType
                                    $copyControl.CheckPosition = $control.CheckPosition
                                    if ($obj.ConnectionAlias -ne $Connection.Alias -and $control.ID -notin $existingIds) {
                                        $copyControl.ID = $control.ID
                                    }
                                    $copyObject.WindowControl.Add($copyControl) | Out-Null
                                }
                                $excludedProperties += "WindowControl"
                            }
                            "WMI"         { $copyObject = [AMWMITriggerv11]::new($Name, $Folder, $Connection.Alias) }
                            default       { throw "Unsupported trigger type '$($obj.TriggerType)' encountered!" }
                        }
                    }
                    default { throw "Unsupported server major version: $_!" }
                }

                if ($PSBoundParameters.ContainsKey("Connection") -and $obj.ConnectionAlias -ne $Connection.Alias) {
                    # If an object with the same ID doesn't already exist, use the same ID (when copying between servers)
                    if ((Get-AMCondition -ID $obj.ID -Connection $Connection -ErrorAction SilentlyContinue | Measure-Object).Count -eq 0) {
                        $copyObject.ID = $obj.ID
                    }
                }

                # Collect all the properties that are defined for the specific object type
                $properties = $currentObject.GetType().GetProperties() | Where-Object {$_.DeclaringType -eq $currentObject.GetType()}
                foreach ($property in $properties | Where-Object {$_.Name -notin $excludedProperties}) {
                    if (($property.PropertyType.IsPrimitive) -or ($property.PropertyType.IsEnum) -or ($property.PropertyType -in [string],[DateTime])) {
                        # If the property is a primitive, set it normally
                        $copyObject."$($property.Name)" = $currentObject."$($property.Name)"
                    } elseif ($property.PropertyType -eq [System.Collections.ArrayList]) {
                        # If the property is an arraylist that contains primitives, loop through and add them
                        foreach ($item in $currentObject."$($property.Name)") {
                            if (($item.GetType().IsPrimitive) -or ($item.GetType().IsEnum) -or ($item.GetType() -in [string],[DateTime])) {
                                $copyObject."$($property.Name)".Add($item)
                            } else {
                                throw "Unsupported property type '$($item.GetType().FullName)' (Property: $item) encountered!"
                            }
                        }
                    } else {
                        throw "Unsupported property type '$($property.PropertyType.FullName)' (Property: $($property.Name)) encountered!"
                    }
                }
                $copyObject.CompletionState = $currentObject.CompletionState
                $copyObject.Enabled         = $currentObject.Enabled
                $copyObject.LockedBy        = $currentObject.LockedBy
                $copyObject.Notes           = $currentObject.Notes
                $copyObject | New-AMObject -Connection $Connection
            } else {
                Write-Error -Message "Unsupported input type '$($obj.Type)' encountered!" -TargetObject $obj
            }
        }
    }
}
