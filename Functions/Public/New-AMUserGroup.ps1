function New-AMUserGroup {
    <#
        .SYNOPSIS
            Creates a new Automate user group.

        .DESCRIPTION
            New-AMUserGroup creates a user group object.

        .PARAMETER Name
            The name of the new object.

        .PARAMETER Notes
            The new notes to set on the object.

        .PARAMETER Folder
            The folder to place the object in.

        .PARAMETER Connection
            The server to create the object on.

        .EXAMPLE
            # Create a user group
            New-AMUserGroup -Name "All Users" -Notes "Group containing all users"

        .LINK
            https://github.com/AutomatePS/AutomatePS/blob/master/Docs/New-AMUserGroup.md
    #>
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact="Low")]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [string]$Notes = "",

        [ValidateScript({$_.Type -eq "Folder"})]
        $Folder,

        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter([AMConnectionCompleter])]
        $Connection
    )

    if ($PSBoundParameters.ContainsKey("Connection")) {
        $Connection = Get-AMConnection -Connection $Connection
    } else {
        $Connection = Get-AMConnection
    }
    switch (($Connection | Measure-Object).Count) {
        1 {
            if (-not $Folder) { $Folder = Get-AMFolder -Path "\" -Name "USERGROUPS" -Connection $Connection }
            switch ($Connection.Version.Major) {
                10                   { $newObject = [AMUserGroupv10]::new($Name, $Folder, $Connection.Alias) }
                {$_ -in 11,22,23,24} { $newObject = [AMUserGroupv11]::new($Name, $Folder, $Connection.Alias) }
                default              { throw "Unsupported server major version: $_!" }
            }
            $newObject.Notes     = $Notes
            $newObject | New-AMObject -Connection $Connection
        }
        0       { throw "No servers are currently connected!" }
        default { throw "Multiple Automate servers are connected, please specify which server to create the new user group on!" }
    }
}