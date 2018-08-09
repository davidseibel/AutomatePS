function Add-AMWindowConditionControl {    
    <#
        .SYNOPSIS
            Adds a control to an AutoMate Enterprise window condition.

        .DESCRIPTION
            Add-AMWindowConditionControl adds a control to an AutoMate Enterprise window condition.

        .PARAMETER InputObject
            The window condition object to add the control to.

        .PARAMETER Class
            The class of the control.

        .PARAMETER Name
            The name of the control.

        .PARAMETER Type
            The type of control.

        .PARAMETER Value
            The value of the control.

        .PARAMETER XPosition
            The X position of the control on screen.

        .PARAMETER YPosition
            The Y position of the control on screen.

        .INPUTS
            The following AutoMate object types can be modified by this function:
            Condition

        .OUTPUTS
            None

        .EXAMPLE
            Get-AMCondition "window" | Add-AMWindowConditionControl -Class ConsoleWindowClass -Name Close -Type PushButton

        .NOTES
            Author(s):     : David Seibel
            Contributor(s) :
            Date Created   : 07/26/2018
            Date Modified  : 08/08/2018

        .LINK
            https://github.com/davidseibel/AutoMatePS
    #>
    [CmdletBinding(DefaultParameterSetName = "Default")]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $InputObject,

        $Class,
        $Name,
        $Type,
        $Value,
        $XPosition,
        $YPosition
    )

    PROCESS {
        foreach ($obj in $InputObject) {
            if (($obj.Type -eq "Condition") -and ($obj.TriggerType -eq [AMTriggerType]::Window)) {
                $updateObject = Get-AMCondition -ID $obj.ID -Connection $obj.ConnectionAlias
                switch ((Get-AMConnection $obj.ConnectionAlias).Version.Major) {
                    10      { $windowcontrol = [AMWindowTriggerControlv10]::new() }
                    default { throw "Unsupported server major version: $_!" }
                }
                if ($PSBoundParameters.ContainsKey("Class")) {
                    $windowcontrol.Class = $Class
                    $windowcontrol.CheckClass = $true
                }
                if ($PSBoundParameters.ContainsKey("Name")) {
                    $windowcontrol.Name = $Name
                    $windowcontrol.CheckName = $true
                }
                if ($PSBoundParameters.ContainsKey("Type")) {
                    $windowcontrol.Type = $Type
                    $windowcontrol.CheckType = $true
                }
                if ($PSBoundParameters.ContainsKey("Value")) {
                    $windowcontrol.Value = $Value
                    $windowcontrol.CheckValue = $true
                }
                if ($PSBoundParameters.ContainsKey("XPosition")) {
                    $windowcontrol.Xpos = $XPosition
                    $windowcontrol.CheckPosition = $true
                }
                if ($PSBoundParameters.ContainsKey("YPosition")) {
                    $windowcontrol.Ypos = $YPosition
                    $windowcontrol.CheckPosition = $true
                }
                $updateObject.WindowControl += $windowcontrol
                $updateObject.ContainsControls = $true
                $updateObject | Set-AMObject
            } else {
                Write-Error -Message "Unsupported input type '$($obj.Type)' and trigger type '$($obj.TriggerType)' encountered!" -TargetObject $obj
            }
        }
    }
}
