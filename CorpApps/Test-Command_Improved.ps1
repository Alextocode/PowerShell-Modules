function Test-Command()
{
 
    <#
            .SYNOPSIS
            Checks, if a function or a cmdlet identified by a unique name exists.
 
            .DESCRIPTION
            Use this function, if you want to check availability of newer Cmdlets or module functions, that might not be
            installed on older systems.
 
            .PARAMETER
            Pass as many (string) arguments as you like to. The arguments should be the items you'd like to check.
 
            .INPUTS
            None. You cannot pipe objects to Test-Command.
 
            .OUTPUTS
            Null, if no argument has been passed.
 
            .OUTPUTS
            System.Boolean if there is exactly one argument given, might be true if the command exists, false, if not.
 
            .OUTPUTS
            System.String if multiple arguments have been passed. For each passed argument its name followed by a true/false is returned.
 
            .EXAMPLE
            Test-Command Get-Command
            >will return true
 
            .EXAMPLE
            Test-Command Invoke-WebRequest Get-Help Do-Nothing
            >will return the following on PowerShell 3.0 and higher:
            >Invoke-WebRequest: True
            >Get-Help: True
            >Do-Nothing: False
    #>
 
 
    switch($args.count)
    {
        0       {
                    return $null;
                    break
                }
        1       {
                    return [bool](Get-Command -Name $args -ErrorAction SilentlyContinue);
                    break
                }
        default {
                    return $args | % {"$_" + ": " + [bool](Get-Command -Name $_ -ErrorAction SilentlyContinue)};
                    break
                }
    }    
}
