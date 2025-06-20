rem __restore-folder-names.cmd

@echo off
setlocal
set "base=G:\Lab\GitHub\in-the-eyeofparadox\iso\Windows_10_20H1_EN-US_KB5058379\Windows\WinSxS"

echo Restoring WinSxS folder names...
echo.

ren "%base%\...1_none_64c4d9881e6fa61a" "amd64_microsoft-windows-deskmon_31bf3856ad364e35_10.0.19041.1_none_64c4d9881e6fa61a"
ren "%base%\...4355_none_a4793e9e116b0bc2" "amd64_microsoft-windows-directx-graphics-tools_31bf3856ad364e35_10.0.19041.4355_none_a4793e9e116b0bc2"
ren "%base%\...4355_none_cc6ecf9ab354fd8e" "amd64_microsoft-windows-dui70_31bf3856ad364e35_10.0.19041.4355_none_cc6ecf9ab354fd8e"
ren "%base%\...4355_none_e1aed1580e44eeb6" "amd64_microsoft-windows-dhcp-client-dll-minwin_31bf3856ad364e35_10.0.19041.4355_none_e1aed1580e44eeb6"
ren "%base%\...5198_none_78e0d0ae6341e09d" "amd64_microsoft-windows-directoryclient-onecore_31bf3856ad364e35_10.0.19041.5198_none_78e0d0ae6341e09d"
ren "%base%\...5438_none_880228cdbfd767b3" "amd64_microsoft-windows-mapcontrol_31bf3856ad364e35_10.0.19041.5438_none_880228cdbfd767b3"
ren "%base%\...5794_none_1add84b212222773" "amd64_microsoft-windows-lsa_31bf3856ad364e35_10.0.19041.5794_none_1add84b212222773"
ren "%base%\...5794_none_2a74c95c8fad5f20" "amd64_microsoft-windows-appx-deployment-client_31bf3856ad364e35_10.0.19041.5794_none_2a74c95c8fad5f20"
ren "%base%\...5794_none_05db5f015f537d22" "amd64_microsoft-windows-a..dholographicdisplay_31bf3856ad364e35_10.0.19041.5794_none_05db5f015f537d22"
ren "%base%\...5794_none_87e815e5bfe9ed0c" "amd64_microsoft-windows-mapcontrol_31bf3856ad364e35_10.0.19041.5794_none_87e815e5bfe9ed0c"
ren "%base%\...5794_none_d5e2481d6bfeebc6" "amd64_microsoft-windows-appx-deployment-server_31bf3856ad364e35_10.0.19041.5794_none_d5e2481d6bfeebc6"
ren "%base%\...5794_none_df8e612fd838cad8" "amd64_microsoft-windows-a..ncredentialprovider_31bf3856ad364e35_10.0.19041.5794_none_df8e612fd838cad8"
ren "%base%\...5794_none_e187ab7e0e61a75c" "amd64_microsoft-windows-dhcp-client-dll-minwin_31bf3856ad364e35_10.0.19041.5794_none_e187ab7e0e61a75c"
ren "%base%\...5794_none_ecdd065d8d80550b" "amd64_microsoft-windows-a..entory-data-sources_31bf3856ad364e35_10.0.19041.5794_none_ecdd065d8d80550b"
ren "%base%\...5848_none_3edcee997c68e116" "amd64_microsoft-windows-deliveryoptimization_31bf3856ad364e35_10.0.19041.5848_none_3edcee997c68e116"
ren "%base%\...5848_none_82a2e4fd8db4941c" "amd64_microsoft-windows-desktopshellext_31bf3856ad364e35_10.0.19041.5848_none_82a2e4fd8db4941c"
ren "%base%\...5848_none_d5d21b9f6c0bef88" "amd64_microsoft-windows-appx-deployment-server_31bf3856ad364e35_10.0.19041.5848_none_d5d21b9f6c0bef88"
ren "%base%\...1_none_49c7a9c019150ac4"     "amd64_microsoft-windows-mdsched_31bf3856ad364e35_10.0.19041.1_none_49c7a9c019150ac4"

echo.
echo Rename process complete.
pause
