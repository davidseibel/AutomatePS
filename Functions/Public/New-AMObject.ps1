function New-AMObject {
    <#
        .SYNOPSIS
            Creates an AutoMate Enterprise object.

        .DESCRIPTION
            New-AMObject receives new AutoMate Enterprise object(s) on the pipeline, or via the parameter $InputObject, and creates the objects.

        .PARAMETER InputObject
            The object(s) to be created.

        .PARAMETER Connection
            The server to create the object on.

        .INPUTS
            The following objects can be created by this function:
            Workflow
            Task
            Process
            TaskAgent
            ProcessAgent
            AgentGroup
            User
            UserGroup

        .NOTES
            Author(s):     : David Seibel
            Contributor(s) :
            Date Created   : 07/26/2018
            Date Modified  : 08/08/2018
        .LINK
            https://github.com/davidseibel/AutoMatePS
    #>
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact="Low")]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $InputObject,

        [Parameter(Mandatory = $true)]
        $Connection
    )

    BEGIN {
        $Connection = Get-AMConnection -Connection $Connection
    }

    PROCESS {
        foreach ($obj in $InputObject) {
            $type = [AMConstructType]$obj.Type
            $splat = @{
                Resource = "$(([AMTypeDictionary]::($type)).RestResource)/create"
                RestMethod = "Post"
                Body = $obj.ToJson()
                Connection = $Connection
            }
            if ($PSCmdlet.ShouldProcess($Connection.Name, "Creating $($type): $(Join-Path -Path $obj.Path -ChildPath $obj.Name)")) {
                Invoke-AMRestMethod @splat | Out-Null
                Write-Verbose "Created $($type): $(Join-Path -Path $obj.Path -ChildPath $obj.Name) on server $($Connection.Name) ($($Connection.Alias))."
            }
        }
    }
}
