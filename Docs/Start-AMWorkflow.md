---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Start-AMWorkflow.md
schema: 2.0.0
---

# Start-AMWorkflow

## SYNOPSIS
Starts Automate workflows.

## SYNTAX

```
Start-AMWorkflow [-InputObject] <Object> [[-Variables] <Hashtable>] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Start-AMWorkflow starts workflows.

## EXAMPLES

### EXAMPLE 1
```
# Starts workflow "My Workflow"
Get-AMWorkflow "My Workflow" | Start-AMWorkflow
```

### EXAMPLE 2
```
# Starts workflow "My Workflow" with variables
Get-AMWorkflow "My Workflow" | Start-AMWorkflow -Variables @{ varName = "test" }
```

## PARAMETERS

### -InputObject
The workflows to start.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Variables
The variables to pass into a workflow or task at runtime.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

### Workflows can be supplied on the pipeline to this function.
## OUTPUTS

### AMInstancev10
### AMInstancev11
## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Start-AMWorkflow.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Start-AMWorkflow.md)

