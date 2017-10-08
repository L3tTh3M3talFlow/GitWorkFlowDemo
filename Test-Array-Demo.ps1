$Array = 1..50

ForEach ($item in $Array)
{
    # Test comment for this repo script.
    Write-Host "$item is an object in the array!" -ForegroundColor Blue
}