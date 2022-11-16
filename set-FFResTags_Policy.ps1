$service            = "Networking"
$res                = "Greystone"
$data               = "IT"
$created            = "Jake Mundy"
$project            = "Infra"
$environ            = "Production"
$confid             = "Internal"

$tags = @{"Service"="$service";"Resource-Owner"="$res";"Data-Owner"="$data";"CreatedBy"="$created";"Project"="$project";"Environment"="$environ";"Confidentiality"="$confid";}

$results = Get-AzPolicyState -PolicyDefinitionName "c09d48f0-fc08-4447-8d18-e5a546cf65b9"

foreach($result in $results){
    if($result.IsCompliant -eq $false){
        #write-host $result.ResourceId -ForegroundColor Yellow
        if($result.ResourceId -like "*rg-infra-prod-uks-networking*"){
            write-host $result.ResourceId -ForegroundColor Green
            Update-AzTag -ResourceId $result.ResourceId -Tag $tags -operation Merge
        }
    }
}