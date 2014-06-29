@echo off
for %%a in (D,E,F,G,H,I,J,K,L,M,N,O,P,R,S,T,U,V,W,X,Y,Z) DO IF EXIST %%a:\sources\setup.exe (SET CDROM=%%a)
echo %CDROM%
%CDROM%:\sources\setup.exe /unattend:%CDROM%:\Autounattend.xml
