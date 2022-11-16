$vms = Get-AzVM

foreach($vm in $vms){
    $tags = (Get-AzResource -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name).Tags
    $tags += @{"Patch-Ring"="Standard"}
    Set-AzResource -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -ResourceType "Microsoft.Compute/VirtualMachines" -Tag $tags -force 
    write-host $tags -ForegroundColor Green
}