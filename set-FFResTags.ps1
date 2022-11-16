get-AzTag -ResourceId $res

$service            = "General VMs"
$res                = "Greystone"
$data               = "IT"
$created            = "Jake Mundy"
$project            = "Infra"
$environ            = "Production"
$confid             = "Internal"

$tags = @{"Service"="$service";"Resource-Owner"="$res";"Data-Owner"="$data";"CreatedBy"="$created";"Project"="$project";"Environment"="$environ";"Confidentiality"="$confid";}

$res = "/subscriptions/ae9969b0-dbb3-4df2-af6f-4faf3aa33cd6/resourcegroups/rg-infra-prod-uks-vm_general/providers/microsoft.compute/virtualmachines/azserver-app12/extensions/azuremonitorwindowsagent"

Update-AzTag -ResourceId $res -Tag $tags -operation Merge