function Start-AMTask {
    <#
        .SYNOPSIS
            Starts AutoMate Enterprise tasks.

        .DESCRIPTION
            Start-AMTask starts tasks.

        .PARAMETER InputObject
            The tasks to start.

        .PARAMETER Agent
            The agent to run the process on.

        .PARAMETER AgentGroup
            The agent group to run the process on.

        .INPUTS
            Tasks can be supplied on the pipeline to this function.

        .EXAMPLE
            # Starts task "My Task" on agent "agent01"
            Get-AMTask "My Task" | Start-AMTask -Agent "agent01"

        .NOTES
            Author(s):     : David Seibel
            Contributor(s) :
            Date Created   : 07/26/2018
            Date Modified  : 08/08/2018

        .LINK
            https://github.com/davidseibel/AutoMatePS
    #>
    [CmdletBinding()]
    [OutputType([System.Object[]])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        $InputObject,

        [Parameter(ParameterSetName = "Agent")]
        [ValidateNotNullOrEmpty()]
        $Agent,

        [Parameter(ParameterSetName = "AgentGroup")]
        [ValidateNotNullOrEmpty()]
        $AgentGroup
    )

    PROCESS {
        foreach ($obj in $InputObject) {
            if ($obj.Type -eq "Task") {
                switch($PSCmdlet.ParameterSetName) {
                    "Agent" {
                        if ($Agent.Type -ne "Agent") {
                            $name = $Agent
                            $Agent = Get-AMAgent -Name $name -Connection $obj.ConnectionAlias
                            if (($Agent | Measure-Object).Count -ne 1) {
                                throw "Agent '$name' not found!"
                            }
                        }
                        if ($Agent.AgentType -eq "TaskAgent") {
                            Write-Verbose "Running task $($obj.Name) on agent $($Agent.Name)."
                            $instanceID = Invoke-AMRestMethod -Resource "tasks/$($obj.ID)/run?agent_id=$($Agent.ID)" -RestMethod Post -Connection $obj.ConnectionAlias
                            Start-Sleep -Seconds 1   # The instance can't be retrieved right away, have to pause briefly
                            Invoke-AMRestMethod -Resource ('instances/list?filter_sets="ID","=","\"' + $instanceID + '\""') -RestMethod Get -Connection $obj.ConnectionAlias
                        } else {
                            throw "Agent $($Agent.Name) is not a process agent!"
                        }
                    }
                    "AgentGroup" {
                        if ($AgentGroup.Type -ne "AgentGroup") {
                            $name = $AgentGroup
                            $AgentGroup = Get-AMAgentGroup -Name $name -Connection $obj.ConnectionAlias
                            if (($AgentGroup | Measure-Object).Count -ne 1) {
                                throw "Agent group '$name' not found!"
                            }
                        }

                        Write-Verbose "Running task $($obj.Name) on agent group $($AgentGroup.Name)."
                        $instanceID = Invoke-AMRestMethod -Resource "tasks/$($obj.ID)/run?agent_group_id=$($AgentGroup.ID)" -RestMethod Post -Connection $obj.ConnectionAlias
                        Start-Sleep -Seconds 1   # The instance can't be retrieved right away, have to pause briefly
                        Invoke-AMRestMethod -Resource ('instances/list?filter_sets="ID","=","\"' + $instanceID + '\""') -RestMethod Get -Connection $obj.ConnectionAlias
                    }
                }
            } else {
                Write-Error -Message "Unsupported input type '$($obj.Type)' encountered!" -TargetObject $obj
            }
        }
    }
}
