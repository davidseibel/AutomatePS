---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Get-AMObjectProperty.md
schema: 2.0.0
---

# Get-AMObjectProperty

## SYNOPSIS
Gets Automate workflow/task/agent properties if non-inherited values are used. 
If the inherited values are used, nothing will be returned.

## SYNTAX

```
Get-AMObjectProperty [[-InputObject] <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get-AMObjectProperty gets properties for objects.

## EXAMPLES

### EXAMPLE 1
```
# Get permissions for workflow "My Workflow"
Get-AMWorkflow "My Workflow" | Get-AMObjectProperty
```

## PARAMETERS

### -InputObject
The object(s) to retrieve properties for.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Properties for the following objects can be retrieved by this function:
### Workflow
### Task
### Agent
## OUTPUTS

### WorkflowProperty, TaskProperty, AgentProperty
## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Get-AMObjectProperty.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Get-AMObjectProperty.md)

