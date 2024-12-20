function New-AMFileSystemCondition {
    <#
        .SYNOPSIS
            Creates a new Automate file system condition.

        .DESCRIPTION
            New-AMFileSystemCondition creates a new file system condition.

        .PARAMETER Name
            The name of the new object.

        .PARAMETER MonitorFolder
            The folder to monitor.

        .PARAMETER Subfolders
            Subfolders will be monitored in addition to the parent folder.

        .PARAMETER WaitForAccess
            No action is taken until a file is no longer in use and fully accessible.

        .PARAMETER UsePollingMode
            Use polling mode with a 5 second interval.

        .PARAMETER FileAdded
            Monitor for files added to the folder.

        .PARAMETER FileRemoved
            Monitor for files removed from the folder.

        .PARAMETER FileRenamed
            Monitor for files renamed in the folder.

        .PARAMETER FileModified
            Monitor for files modified in the folder.

        .PARAMETER FolderAdded
            Monitor for folders added to the folder.

        .PARAMETER FolderRemoved
            Monitor for folders removed from the folder.

        .PARAMETER FolderRenamed
            Monitor for folders renamed in the folder.

        .PARAMETER FolderModified
            Monitor for folders modified in the folder.

        .PARAMETER FileCount
            No action is taken until the number of files specified is met.

        .PARAMETER FolderCount
            No action is taken until the number of folders specified is met.

        .PARAMETER FileSize
            No action is taken until the size of files specified is met.

        .PARAMETER FolderSize
            No action is taken until the size of folders specified is met.

        .PARAMETER Include
            Specifies the filter(s) to be included in the search.

        .PARAMETER Exclude
            Specifies the filter(s) to be excluded from the search.

        .PARAMETER UserMode
            Specify to use the default agent user (DefaultUser) or a specified user (SpecifiedUser).

        .PARAMETER UserName
            The username used to authenticate with the database.

        .PARAMETER Password
            The password for the specified user.

        .PARAMETER Domain
            The domain for the specified user.

        .PARAMETER Wait
            Wait for the condition, or evaluate immediately.

        .PARAMETER Timeout
            If wait is specified, the amount of time before the condition times out.

        .PARAMETER TimeoutUnit
            The unit for Timeout (Seconds by default).

        .PARAMETER TriggerAfter
            The number of times the condition should occur before the trigger fires.

        .PARAMETER IgnoreExistingCondition
            Don't trigger on startup if condition is true.

        .PARAMETER Notes
            The new notes to set on the object.

        .PARAMETER Folder
            The folder to place the object in.

        .PARAMETER Connection
            The server to create the object on.

        .EXAMPLE
            New-AMFileSystemCondition -Name "Monitor folder C:\temp" -MonitorFolder "C:\temp" -FileAdded

        .LINK
            https://github.com/AutomatePS/AutomatePS/blob/master/Docs/New-AMFileSystemCondition.md
    #>
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact="Low")]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory = $true, Position = 1)]
        [string]$MonitorFolder,

        [ValidateNotNullOrEmpty()]
        [switch]$Subfolders = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$WaitForAccess = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$UsePollingMode = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FileAdded = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FileRemoved = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FileRenamed = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FileModified = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FolderAdded = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FolderRemoved = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FolderRenamed = $false,

        [ValidateNotNullOrEmpty()]
        [switch]$FolderModified = $false,

        [ValidateNotNullOrEmpty()]
        [int]$FileCount = -1,

        [ValidateNotNullOrEmpty()]
        [int]$FolderCount = -1,

        [ValidateNotNullOrEmpty()]
        [int]$FileSize = -1,

        [ValidateNotNullOrEmpty()]
        [int]$FolderSize = -1,

        [string]$Include = "",
        [string]$Exclude = "",

        [ValidateNotNullOrEmpty()]
        [AMConditionUserMode]$UserMode = [AMConditionUserMode]::NoUser,
        [string]$UserName = "",
        #[string]$Password, API BUG: does not support setting password via REST call
        [string]$Domain = "",

        [ValidateNotNullOrEmpty()]
        [switch]$Wait = $true,
        [int]$Timeout = 0,
        [AMTimeMeasure]$TimeoutUnit = [AMTimeMeasure]::Seconds,
        [int]$TriggerAfter = 1,
        [switch]$IgnoreExistingCondition = $false,

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
            if (-not $Folder) { $Folder = Get-AMDefaultFolder -Connection $Connection -Type CONDITIONS }
            switch ($Connection.Version.Major) {
                10                   { $newObject = [AMFileSystemTriggerv10]::new($Name, $Folder, $Connection.Alias) }
                {$_ -in 11,22,23,24} { $newObject = [AMFileSystemTriggerv11]::new($Name, $Folder, $Connection.Alias) }
                default              { throw "Unsupported server major version: $_!" }
            }
            $newObject.Notes           = $Notes
            $newObject.Folder          = $MonitorFolder
            $newObject.SubFolders      = $Subfolders.IsPresent
            $newObject.WaitForAccess   = $WaitForAccess.IsPresent
            $newObject.FileAdded       = $FileAdded.IsPresent
            $newObject.FileRemoved     = $FileRemoved.IsPresent
            $newObject.FileRenamed     = $FileRenamed.IsPresent
            $newObject.FileModified    = $FileModified.IsPresent
            $newObject.FolderAdded     = $FolderAdded.IsPresent
            $newObject.FolderRemoved   = $FolderRemoved.IsPresent
            $newObject.FolderRenamed   = $FolderRenamed.IsPresent
            $newObject.FolderModified  = $FolderModified.IsPresent
            $newObject.FileCount       = $FileCount
            $newObject.FileSize        = $FileSize
            $newObject.FolderCount     = $FolderCount
            $newObject.FolderSize      = $FolderSize
            $newObject.Include         = $Include
            $newObject.Exclude         = $Exclude
            $newObject.UserMode        = $UserMode
            $newObject.Wait            = $Wait.IsPresent
            if ($UsePollingMode.IsPresent) {
                if (Test-AMFeatureSupport -Connection $Connection -Feature FileSystemConditionPollingMode -Action Warn) {
                    $newObject.PollingInterval = 11
                }
            }
            if ($newObject.UserMode -eq [AMConditionUserMode]::SpecifiedUser) {
                $newObject.UserName = $UserName
                #$newObject.Password = $Password
                $newObject.Domain   = $Domain
            }
            if ($newObject.Wait) {
                $newObject.Timeout                 = $Timeout
                $newObject.TimeoutUnit             = $TimeoutUnit
                $newObject.TriggerAfter            = $TriggerAfter
                $newObject.IgnoreExistingCondition = $IgnoreExistingCondition.IsPresent
            }
            $newObject | New-AMObject -Connection $Connection
        }
        0       { throw "No servers are currently connected!" }
        default { throw "Multiple Automate servers are connected, please specify which server to create the new condition on!" }
    }
}