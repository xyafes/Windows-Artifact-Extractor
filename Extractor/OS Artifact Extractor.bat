@echo off
color B
echo System Infermation Starting..
mkdir "%userprofile%\Desktop\Extractor\Report"
%userprofile%\Desktop\Extractor\library\PsInfo -accepteula -s -d > "%userprofile%\Desktop\Extractor\Report\SystemDetails.txt"
systeminfo > "%userprofile%\Desktop\Extractor\Report\SystemInfo.txt"
set > "%userprofile%\Desktop\Extractor\Report\SystemVariables.txt"
wmic /output:"%userprofile%\Desktop\Extractor\Report\InstallList.csv" product get /format:csv
tasklist /V /FO CSV > "%userprofile%\Desktop\Extractor\Report\Processes.csv"
tasklist /SVC /FO CSV > "%userprofile%\Desktop\Extractor\Report\Processe2exeMap.csv" 
tasklist /M /FO CSV > "%userprofile%\Desktop\Extractor\Report\ProcesseDLL.csv"
%userprofile%\Desktop\Extractor\library\pslist -accepteula >> "%userprofile%\Desktop\Extractor\Report\Processes.txt"
%userprofile%\Desktop\Extractor\library\pslist -t -accepteula >> "%userprofile%\Desktop\Extractor\Report\ProcessTree.txt"
%userprofile%\Desktop\Extractor\library\tcpvcon -anc -accepteula >> "%userprofile%\Desktop\Extractor\Report\Process2PortMap.csv"
wmic /output:"%userprofile%\Desktop\Extractor\Report\ProcessesCmd.csv" process get Caption;Commandline;Processid;ParentProcessId;SessionId /format:csv
sc queryex > "%userprofile%\Desktop\Extractor\Report\ServiceQuery.txt"
%userprofile%\Desktop\Extractor\library\psservice -accepteula > "%userprofile%\Desktop\Extractor\Report\ServiceProcesses.txt"
net start > "%userprofile%\Desktop\Extractor\Report\ServicesStarted.txt"
net accounts > "%userprofile%\Desktop\Extractor\Report\AccountDetails.txt"
net config > "%userprofile%\Desktop\Extractor\Report\NetConfig.txt"
net user > "%userprofile%\Desktop\Extractor\Report\NetUser.txt"
net user Guest > "%userprofile%\Desktop\Extractor\Report\NetUserGuest.txt"
net statistics Server > "%userprofile%\Desktop\Extractor\Report\NetStatisticsServer.txt"
DRIVERQUERY > "%userprofile%\Desktop\Extractor\Report\DriverQuery.txt"
net localgroup administrators > "%userprofile%\Desktop\Extractor\Report\AccountAdminList.txt"
%userprofile%\Desktop\Extractor\library\autorunsc.exe -accepteula > "%userprofile%\Desktop\Extractor\Report\AutoRunInfo.txt"
wmic startup list full > "%userprofile%\Desktop\Extractor\Report\StartUpWMIInfo.txt"
%userprofile%\Desktop\Extractor\library\autorunsc.exe -accepteula -a * -s -ct > "%userprofile%\Desktop\Extractor\Report\AutoRunInfo.csv"
schtasks /query /FO CSV /V > "%userprofile%\Desktop\Extractor\Report\ScheduledTasks.csv"
%userprofile%\Desktop\Extractor\library\handle -a -accepteula c > "%userprofile%\Desktop\Extractor\Report\Handles.txt"
whoami > "%userprofile%\Desktop\Extractor\Report\Hosttname.txt"
hostname >> "%userprofile%\Desktop\Extractor\Report\Hostname.txt"
echo System Infermation Ended.
echo.
echo Network Infermation Starting..
ipconfig /all > "%userprofile%\Desktop\Extractor\Report\IPConfigInfo.txt"
netsh int ip show config > "%userprofile%\Desktop\Extractor\Report\IPInterfaceInfo.txt"
ipconfig /displaydns > "%userprofile%\Desktop\Extractor\Report\DNSInfo.txt"
nslookup host server > "%userprofile%\Desktop\Extractor\Report\DNSnslookup.txt"
arp -a > "%userprofile%\Desktop\Extractor\Report\ARPTable.txt"
C:\WINDOWS\System32\nbtstat.exe -A 127.0.0.1 > "%userprofile%\Desktop\Extractor\Report\NBTstat.txt"
route PRINT > "%userprofile%\Desktop\Extractor\Report\RoutesPrint.txt"
netstat -r > "%userprofile%\Desktop\Extractor\Report\RoutesNetstat.txt"
netstat -nao > "%userprofile%\Desktop\Extractor\Report\NetworkConnections.txt"
netstat -naob > "%userprofile%\Desktop\Extractor\Report\NetworkConnectionsProcesses.txt"
net Session > "%userprofile%\Desktop\Extractor\Report\Sessions.txt"
net share > "%userprofile%\Desktop\Extractor\Report\LocalShares.txt"
net file > "%userprofile%\Desktop\Extractor\Report\OpenSharedFiles.txt"
net view > "%userprofile%\Desktop\Extractor\Report\NetView.txt"
echo Network Infermation Ended.
echo.
echo Registry Block Starting..
REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows\ > "%userprofile%\Desktop\Extractor\Report\RegQuery.txt"
REG SAVE HKLM\SYSTEM "%userprofile%\Desktop\Extractor\Report\SYSTEM_DESKTOP.hiv" /y
REG SAVE HKLM\SOFTWARE "%userprofile%\Desktop\Extractor\Report\SOFTWARE_DESKTOP.hiv" /y
REG SAVE HKCU "%userprofile%\Desktop\Extractor\Report\HKCU_DESKTOP.hiv" /y
REG SAVE HKEY_USERS\.DEFAULT "%userprofile%\Desktop\Extractor\Report\DESKTOP-USER_1.dat" /y
REG SAVE HKEY_USERS\S-1-5-19 "%userprofile%\Desktop\Extractor\Report\DESKTOP-USER_2.dat" /y
REG SAVE HKEY_USERS\S-1-5-20 "%userprofile%\Desktop\Extractor\Report\DESKTOP-USER_3.dat" /y
REG SAVE HKEY_USERS\S-1-5-21-492203786-33974307-3094449070-1001 "%userprofile%\Desktop\Extractor\Report\DESKTOP-USER_4.dat" /y
REG SAVE HKEY_USERS\S-1-5-21-492203786-33974307-3094449070-1001_Classes "%userprofile%\Desktop\Extractor\Report\DESKTOP-USER_5.dat" /y
REG SAVE HKEY_USERS\S-1-5-18 "%userprofile%\Desktop\Extractor\Report\DESKTOP-USER_6.dat" /y
REG SAVE HKLM\SECURITY "%userprofile%\Desktop\Extractor\Report\SECURITY-DESKTOP.hiv" /y
REG SAVE HKLM\SAM "%userprofile%\Desktop\Extractor\Report\SAM-DESKTOP.hiv" /y
echo Registry Block Ended.
echo.
echo Disk Infermation Starting..
%userprofile%\Desktop\Extractor\library\ntfsinfo  -accepteula c > "%userprofile%\Desktop\Extractor\Report\NTFSInfo.txt"
fsutil fsinfo ntfsinfo C: >> "%userprofile%\Desktop\Extractor\Report\NTFSInfo.txt"
fsutil fsinfo volumeinfo C: > "%userprofile%\Desktop\Extractor\Report\VolumeInfo.txt"
%userprofile%\Desktop\Extractor\library\diskext -accepteula > "%userprofile%\Desktop\Extractor\Report\DiskMounts.txt"
tree c:\ /f /a > "%userprofile%\Desktop\Extractor\Report\DirectoryInfo.txt"
echo Disk Infermation Ended.
echo.
echo Evidence Collection Starting..
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\WINDOWSPrefetch" "%userprofile%\Desktop\Extractor\Report\\Prefetch" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\PrefetchCopyLog.txt"
"%userprofile%\Desktop\Extractor\library\WinPrefetchView.exe" /Folder "%userprofile%\Desktop\Extractor\Report\Prefetch" /stab "%userprofile%\Desktop\Extractor\Report\Prefetch.csv"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\All Users\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\All Users" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_Recent_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\Default" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_Recent_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Default User\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\Default User" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_Recent_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\user" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_Recent_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Public\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\Public" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_Recent_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\All Users\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\All Users\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Default User\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Default User\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Public\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\Users\Public\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_JumpList_Custom_Copy.txt"
%userprofile%\Desktop\Extractor\library\psloglist.exe -accepteula -s Application > "%userprofile%\Desktop\Extractor\Report\ApplicationLog.csv"
%userprofile%\Desktop\Extractor\library\psloglist.exe -accepteula -s System > "%userprofile%\Desktop\Extractor\Report\SystemLog.csv"
%userprofile%\Desktop\Extractor\library\psloglist.exe -accepteula -s Security > "%userprofile%\Desktop\Extractor\Report\SecurityLog.csv"
MOVE /Y "%userprofile%\Desktop\Extractor\library\DumpIt.exe" "%userprofile%\Desktop\Extractor\Report\DumpIt.exe"
echo Evidence Collection Ended.
echo.
cd "%userprofile%\Desktop"
cd "Extractor\Report"
DumpIt.exe
echo.
MOVE /Y "%userprofile%\Desktop\Extractor\Report\DumpIt.exe" "%userprofile%\Desktop\Extractor\library\DumpIt.exe"
echo Volume Shadow Copies Starting..
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Windows\Prefetch" "%userprofile%\Desktop\Extractor\Report\VSC_1\Prefetch" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\VSC_1 Prefetch Copy Log.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\\All Users\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\VSC_1\RecentLNKs\All Users" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_RecentFolder_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\\Default\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\VSC_1\RecentLNKs\Default" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_RecentFolder_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\\Default User\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\VSC_1\RecentLNKs\Default User" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_RecentFolder_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\\%username%\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\VSC_1\RecentLNKs\user" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_RecentFolder_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\\Public\AppData\Roaming\Microsoft\Windows\Recent" "%userprofile%\Desktop\Extractor\Report\VSC_1\RecentLNKs\Public" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_RecentFolder_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\All Users\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\All Users\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\All Users\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\All Users\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Default\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\Default\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Default\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\Default\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Default User\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\Default User\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Default User\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\Default User\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\%userprofile%\Desktop\Extractor\library\\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\User\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\User\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Public\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\Public\Automatic" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_JumpList_Auto_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Public\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations" "%userprofile%\Desktop\Extractor\Report\VSC_1\JumpLists\Public\Custom" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_JumpList_Custom_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robo7.exe" "C:\VSC_1\Windows\system32\winevt\Logs" "%userprofile%\Desktop\Extractor\Report\VSC_1\Logs" /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\VSC_1_EventLogCopy.txt"
"%userprofile%\Desktop\Extractor\library\robo7.exe" "C:\VSC_1\Windows\System32\Config" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry" SYSTEM /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\VSC_1_SYSTEM_Log_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robo7.exe" "C:\VSC_1\Windows\System32\Config" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry" SECURITY /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\VSC_1_SYSTEM_Log_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robo7.exe" "C:\VSC_1\Windows\System32\Config" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry" SAM /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\VSC_1_SYSTEM_Log_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robo7.exe" "C:\VSC_1\Windows\System32\Config" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry" SOFTWARE /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\VSC_1_SYSTEM_Log_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\All Users" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry\All Users" NTUSER.DAT /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\All Users_NTUSER_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Default" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry\Default" NTUSER.DAT /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default_NTUSER_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Default User" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry\Default User" NTUSER.DAT /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Default User_NTUSER_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\%username%" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry\user" NTUSER.DAT /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\User_NTUSER_Copy.txt"
"%userprofile%\Desktop\Extractor\library\robocopy.exe" "C:\VSC_1\Users\Public" "%userprofile%\Desktop\Extractor\Report\VSC_1\Registry\Public" NTUSER.DAT /copyall /ZB /TS /r:4 /w:3 /FP /NP /log:"%userprofile%\Desktop\Extractor\Report\Public_NTUSER_Copy.txt"
echo Volume Shadow Copies Ended.
"%userprofile%\Desktop\Extractor\library\7za.exe" a -tzip "%userprofile%\Desktop\Extractor\ReportZip.zip" -r "%userprofile%\Desktop\Extractor\Report" -mx5
pause