$Content = get-content .\AoC_2024\Day1\Day1_input.txt
#$Content = get-content .\AoC_2024\Day1\Day1_test.txt

$Holder = 0
$LeftSet = @()
$RightSet= @()

foreach ($NumberSet in $Content){
    $Set = $NumberSet -split "   "
    $LeftSet += $set[0]
    $RightSet += $set[1]
}

$LeftSet = $LeftSet | Sort-Object
$RightSet = $RightSet | Sort-Object

for($i=0; $i -lt $LeftSet.count; $i++){
    $Set = @($LeftSet[$i],$RightSet[$i])
    $set = $set | Sort-Object -Descending
    $Holder = $holder + ($set[0] - $set[1])
}

Write-output "First solution is $holder"

[Int32]$holder2 = 0

for($i=0; $i -lt $LeftSet.count; $i++){
    [Int]$Count = ($rightset | Where-Object {$_ -eq $LeftSet[$i]}).count
    If($count -gt 0){
        [Int32]$T = ([int]$($LeftSet[$i]) * $Count)
        $holder2 = $holder2 + $T
    }
}
Write-output "Second solution is $holder2"