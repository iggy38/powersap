  <#
    .Synopsis
      Check NCo version.
    .Description
      Load .NET connector to  return version, patch level and SAP release.
    .Author
      @_Sn0rkY
  #>

# Loads NCo libraries
 Function Load-NCo {

      $ScriptDir = $PsScriptRoot
      
      $Size = [System.IntPtr]::Size
        If ($Size -eq 4) {
        $Path = $ScriptDir + "\..\NCo_x86\"
      }
      ElseIf ($Size -eq 8) {
        $Path = $ScriptDir + "\..\NCo_x86_64\"
      }

      [Reflection.Assembly]::LoadFile($Path + "sapnco.dll") > $Null
      [Reflection.Assembly]::LoadFile($Path + "sapnco_utils.dll") > $Null

    }

# Function Get-NCoVersion
  Function Get-NCoVersion {
    
    # Gets the version of NCo
        $Version = 
        [SAP.Middleware.Connector.SAPConnectorInfo]::get_Version()
        $PatchLevel = 
        [SAP.Middleware.Connector.SAPConnectorInfo]::get_KernelPatchLevel()
        $SAPRelease = 
        [SAP.Middleware.Connector.SAPConnectorInfo]::get_SAPRelease()
        
    # Shows the result
        Write-Host "`r`nNCo Version:" $Version
        Write-Host "Patch Level:" $PatchLevel
        Write-Host "SAP Release:" $SAPRelease
        
    }
    
  # Main
  Load-NCo 
  Get-NCoVersion
  # End        
