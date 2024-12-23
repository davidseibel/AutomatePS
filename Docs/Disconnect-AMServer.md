---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Disconnect-AMServer.md
schema: 2.0.0
---

# Disconnect-AMServer

## SYNOPSIS
Disconnect from an Automate management server

## SYNTAX

### All (Default)
```
Disconnect-AMServer [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ByConnection
```
Disconnect-AMServer [[-Connection] <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Disconnect-AMServer removes stored connection information for the management server(s).

## EXAMPLES

### EXAMPLE 1
```
Disonnect-AMServer -Connection "AM01" -Credential (Get-Credential)
```

## PARAMETERS

### -Connection
The Automate management server.
If the server isn't specified, all servers are removed.

```yaml
Type: Object
Parameter Sets: ByConnection
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Disconnect-AMServer.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Disconnect-AMServer.md)

