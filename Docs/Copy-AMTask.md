---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Copy-AMTask.md
schema: 2.0.0
---

# Copy-AMTask

## SYNOPSIS
Copies an Automate task.

## SYNTAX

```
Copy-AMTask [-InputObject] <Object> [[-Name] <String>] [[-Folder] <Object>] [[-Connection] <Object>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Copy-AMTask can copy a task object within, or between servers.

## EXAMPLES

### EXAMPLE 1
```
# Copy task "Start Service" from server1 to server2
Get-AMTask "Start Service" -Connection server1 | Copy-AMTask -Folder (Get-AMFolder TASKS -Connection server2) -Connection server2
```

### EXAMPLE 2
```
# Copy task "Start Service" with new name "Restart Service"
Get-AMTask "Start Service" | Copy-AMTask -Name "Restart Service"
```

## PARAMETERS

### -InputObject
The object to copy.

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

### -Name
The new name to set on the object.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Folder
The folder to place the object in.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Connection
The server to copy the object to.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
### Task
## OUTPUTS

### Task
## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Copy-AMTask.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Copy-AMTask.md)

