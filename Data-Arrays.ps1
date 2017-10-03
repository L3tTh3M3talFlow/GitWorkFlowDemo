<# See https://technet.microsoft.com/en-us/library/ee692797.aspx for details (as well as other tips)

PowerShell makes it very easy to create arrays and to add new items to arrays. A PowerShell array holds a list of data items.
To create an array just separate the elements/items with commas.
$Groups = "one","two","three cats"

# Add a range of values to an array.
$a = 1..100

# To see what type the array is.
$array.gettype()

# Create an array using explicit syntax.
$Groups = @(One,"Two","Three Cats")

#>

# The Get-Verb cmdlet returns an array. Array objects always contain a count property.  Is count the same as length?
# Measure-Object | Get-Member shows the property "count".
(Get-verb).Count 

<# Create a "strongly" typed array, an array that can contain ONLY numbers or only dates or only whatever.
# [int[]] $a = 1,2,3,4
# Specify the integer data type (int) before declaring the variable $a and assigning that variable a set of values.  You won't be able to add any non-integer values to the array.
# Also you can't add a string value to an array of integers.
#>

# Add values to an array using the += operator.
# $Countries += 'India'

# Retrieve items from an array by specifying its number.  PowerShell numbers the array elements starting at 0.
#Groups[0] returns the first item in the array.  If you wanted to see the third item, type $Groups[2]


<# A simple one liner that loops through the items/elements in the array returning name and grouptype properties.
# foreach ($element in $myArray) {$element/item}
Foreach ($Group in $Groups) {Get-ADGroup -Identity $Group -Properties * | Select Name,GroupType}
#>

# Combine two arrays into a single array.
# $a = "red","white","blue"
# $b = "black","white","gold"
# $c = $a + $b

# Find out whether a command will return data as an array.
# $a = "command"
# $a -is [Array]

# Find the number of items in the array.
# $a.count

<# It is important to understand that PowerShell will use arrays. If a command returns just one result, it will happily return that exact result to you. 
# Only when a command returns more than one result will it wrap them in an array.

# Use @() if you'd like to force a command to always return its result in an array. This way you find out the number of files in a folder:
# $result = @(Dir $env:windir -ea 0)
# $result.Count <-- Returns the number of items in the array.

# Or in a line:
# $result = @(Dir $env:windir -ea 0).Count
#>

<# Store results of an array and then pass along a pipeline to filter out text.  In this example we only care about lines containing the word "Address".
$result = ipconfig
$result | Where-Object { $_ -like "*Address*" }
# The alias for "Where-Object" is "?".
#>

<# An array can store any type of value you assign. This way, you can store whatever you want in an array, even a mixture of different data types. 
# Again, you can separate the elements by using commas:
$array = "Hello", "World", 1, 2, (Get-Date)
$array 
Hello
World
1
2
Tuesday, August 21, 2007 12:12:28 
#>

<# Simeple example
  [array]$Array = 1..100

  ForEach ($_ in $Array)
  {
   Write-Host -ForegroundColor Green "$_ is an object in the array!"
  }
#>

<#
$Array = 1..100

ForEach ($_ in $Array) { Write-Host -ForegroundColor Yellow "$_ is an object in the array!" }
#>