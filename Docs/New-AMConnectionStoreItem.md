---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/New-AMConnectionStoreItem.md
schema: 2.0.0
---

# New-AMConnectionStoreItem

## SYNOPSIS
Save the connection for the specified Automate server

## SYNTAX

### ByCredential
```
New-AMConnectionStoreItem [-Server] <String> -Port <Int32> [-ConnectionAlias <String>]
 [-Credential <PSCredential>] [-FilePath <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ByUserPass
```
New-AMConnectionStoreItem [-Server] <String> -Port <Int32> [-ConnectionAlias <String>] [-UserName <String>]
 [-Password <SecureString>] [-FilePath <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
New-AMConnectionStoreItem stores a server and credential object together in a credential store file.

## EXAMPLES

### EXAMPLE 1
```
New-AMConnectionStoreItem -Connection server01 -Credential (Get-Credential)
```

## PARAMETERS

### -Server
The Automate management server.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
The TCP port for the management API.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConnectionAlias
The alias to save with the stored connection.

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

### -Credential
The credentials use during authentication.

```yaml
Type: PSCredential
Parameter Sets: ByCredential
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserName
The username to use during authentication.

```yaml
Type: String
Parameter Sets: ByUserPass
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
The password to use during authentication.

```yaml
Type: SecureString
Parameter Sets: ByUserPass
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilePath
The file to store the server/credential combinations in. 
It is stored in the user profile by default.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: "$($env:APPDATA)\AutomatePS\connstore.xml"
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/New-AMConnectionStoreItem.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/New-AMConnectionStoreItem.md)

