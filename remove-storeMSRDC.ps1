get-appxpackage | ?{$_.name -like "*Microsoft.RemoteDesktop*"} | remove-appxpackage
get-appxpackage | ?{$_.name -like "*Microsoft.RemoteDesktop*"} | remove-appxpackage -allusers