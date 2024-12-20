---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Resume-AMInstance.md
schema: 2.0.0
---

# Resume-AMInstance

## SYNOPSIS
Resumes Automate workflow and task instances.

## SYNTAX

### All (Default)
```
Resume-AMInstance [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ByPipeline
```
Resume-AMInstance [-InputObject <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Resume-AMInstance resumes paused workflow and task instances.

## EXAMPLES

### EXAMPLE 1
```
# Resumes all currently paused instances
Get-AMInstance -Status Paused | Resume-AMInstance
```

### EXAMPLE 2
```
# Resumes all currently paused instances of workflow "My Workflow"
Get-AMWorkflow "My Workflow" | Get-AMInstance -Status Paused | Resume-AMInstance
```

## PARAMETERS

### -InputObject
The instances to resumes.

```yaml
Type: Object
Parameter Sets: ByPipeline
Aliases:

Required: False
Position: Named
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

### Instances can be supplied on the pipeline to this function.
## OUTPUTS

### Instance
## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Resume-AMInstance.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Resume-AMInstance.md)

