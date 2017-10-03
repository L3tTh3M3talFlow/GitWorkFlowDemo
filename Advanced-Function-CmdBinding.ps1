<#
Function Get-Stuff {
# The first step in creating an advanced function is to add the cmdletbinding attribute. This single addition adds 
# several capabilities such as additional parameter checking, and the ability to easily use the Write-Verbose cmdlet.
# When the cmdletbinding attribute is not specified, you will only see the parameters you have explicitly defined.

[cmdletbinding()]
    
    # The cmdletbinding attribute requires the use of param keyword.  If your advanced function requires no parameters, you 
    # can use the keyword without specifying any parameters.
    Param(
          [Parameter(Mandatory=$true,ValueFromPipeLine=$true)]
          [string[]]$Name
         )
    PROCESS {
             Foreach ($Thing in $Name)
             {
              Write-Verbose "Getting $Thing"
             }
            }
           } # End function

# PS C:\Get-Stuff -Name "ABCXYZ" -Verbose

# When loaded, the function permits the use of the verbose switched parameter.  Use of this parameter causes each Write-Verbose statement to write to 
# the Windows PowerShell console output.  When the function runs without the verbose switch, no output displays from the verbose stream.
# Get-Stuff -Name "ABC" -Verbose

# The great thing about using Write-Verbose is that detailed information (such as the progress in making remote connections, loading modules, and 
# other operations that could cause a script to fail) outputs as events happen.  This provides a built-in diagnostic mode for the advanced function with 
# virtually no additional programing.
#>

Function Get-Stuff {
    [cmdletbinding()]
    Param(
          # True indicates the cmdlet parameter is required. If a required parameter is not provided when the cmdlet is invoked, Windows 
          # PowerShell prompts the user for a parameter value.
          # True indicates that the cmdlet parameter takes its value from a pipeline object.
          [Parameter(Mandatory=$true,ValueFromPipeLine=$true)]
          [array]$Array
         )
    PROCESS {
             Foreach ($item in $array)
             {
              Write-Verbose "$item is an item in the array."
              # Write-Host "$item is an item in the array." -ForegroundColor Yellow
             }
            }
           } # End function

# PS C:\Get-Stuff -Array 1,2,3,4,5 -Verbose <-- Output is written to the console.
# PS C:\Get-Stuff -Array 1,2,3,4,5 <-- No outputput is written to the console.