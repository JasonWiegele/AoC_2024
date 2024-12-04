$Content = get-content .\AoC_2024\Day2\Day2_input.txt
#$content = get-content .\AoC_2024\Day2\Day2_TestMore.txt
#$Content = get-content .\AoC_2024\Day2\Day2_test.txt

$GoodLevelMoves = @(1,2,3,-1,-2,-3)
$GoodReportCount = 0
#$Holder =@()

Foreach ($Report in $Content){
    $ReportArray = $Report -split '\s+'
    $NotGoodReport = $false

    #decreasing
    If ([int]$ReportArray[0] -ge [int]$ReportArray[1]){
        Write-Output "decreasing"
        For(($i=0),($j=1) ; $i -lt $($ReportArray.count - 1) ; $i++,$j++){

            $LevelChange = [int]$ReportArray[$i] - [int]$ReportArray[$j]
            
            if([int]$ReportArray[$i] -le [int]$ReportArray[$j] -or $LevelChange -notin $GoodLevelMoves){
                $NotGoodReport = $true
                break
            }
            
        }
    }
    #increasing
    elseif ([int]$ReportArray[0] -le [int]$ReportArray[1]){
        Write-Output "increasing"
        For(($i=0),($j=1) ; $i -lt $($ReportArray.count - 1) ; $i++,$j++){
            $LevelChange = [int]$ReportArray[$i] - [int]$ReportArray[$j]
            if([int]$ReportArray[$i] -ge [int]$ReportArray[$j] -or $LevelChange -notin $GoodLevelMoves){
                $NotGoodReport = $true
                break
            }
        }
    }

    If(!$NotGoodReport){
        $GoodReportCount++
    }
   # $Temp = "" | select ReportArray,NotGoodReport
   # $Temp.ReportArray = $ReportArray
   # $temp.NotGoodReport = $NotGoodReport

   # $Holder += $Temp
}
$GoodReportCount