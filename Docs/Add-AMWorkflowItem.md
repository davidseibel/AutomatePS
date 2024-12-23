---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Add-AMWorkflowItem.md
schema: 2.0.0
---

# Add-AMWorkflowItem

## SYNOPSIS
Adds an item to an Automate workflow

## SYNTAX

### ByConstruct
```
Add-AMWorkflowItem -InputObject <Object> -Item <Object> [-Agent <Object>] [-UseLabel] [-Label <String>]
 [-X <Int32>] [-Y <Int32>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByEvaluation
```
Add-AMWorkflowItem -InputObject <Object> -Expression <String> [-UseLabel] [-Label <String>] [-X <Int32>]
 [-Y <Int32>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByWait
```
Add-AMWorkflowItem -InputObject <Object> [-Wait] [-UseLabel] [-Label <String>] [-X <Int32>] [-Y <Int32>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Add-AMWorkflowItem can add an item to an Automate workflow

## EXAMPLES

### EXAMPLE 1
```
# Add task "Copy Files" to workflow "FTP Files"
Get-AMWorkflow "FTP Files" | Add-AMWorkflowItem -Item (Get-AMTask "Copy Files")
```

## PARAMETERS

### -InputObject
The workflow to add the item to.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Item
The item to add to the workflow.

```yaml
Type: Object
Parameter Sets: ByConstruct
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Agent
The agent to assign the item to in the workflow.

```yaml
Type: Object
Parameter Sets: ByConstruct
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Expression
The expression to set on the evaluation object.

```yaml
Type: String
Parameter Sets: ByEvaluation
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
Adds a wait object.

```yaml
Type: SwitchParameter
Parameter Sets: ByWait
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseLabel
If the item should use the configured label or not.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
The label to place on the item (specify -UseLabel) to show the label in the workflow designer.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -X
The X (horizontal) location of the new item.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Y
The Y (vertical) location of the new item.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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

### The following Automate object types can be modified by this function:
### Workflow
## OUTPUTS

### None
## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Add-AMWorkflowItem.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Add-AMWorkflowItem.md)

