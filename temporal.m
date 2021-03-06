clc;clear all;close all

namelist = dir('datamultipathDowntown/*.dat');
x=read_complex_binary(['datamultipathDowntown/',namelist(1).name]);
for i=2:length(namelist)

    x=[x read_complex_binary(['datamultipathDowntown/',namelist(i).name])];
    
end

Z = x(:,1);

MASTER=zeros(1458,1);
MASTER1=[];
MASTER2=[];
MASTER3=[];

for i=1:1458
[~,x1]=max(x(i,:));
[~,x2]=max(x(i+1,:));
[~,x3]=max(x(i+2,:));
[~,x4]=max(x(i+3,:));
[~,x5]=max(x(i+4,:));
[~,x6]=max(x(i+5,:));
[~,x7]=max(x(i+6,:));
[~,x8]=max(x(i+7,:));
[~,x9]=max(x(i+8,:));
[~,x10]=max(x(i+9,:));
[~,x11]=max(x(i+10,:));
[~,x12]=max(x(i+11,:));
[~,x13]=max(x(i+12,:));
[~,x16]=max(x(i+15,:));
[~,x19]=max(x(i+18,:));
p=polyfit([1:7],[x1 x2 x3 x4 x5 x6 x7],3);
q=mod(round(polyval(p,8)),160)+1;
MASTER1=[MASTER1 polyval(Z,x(i+7,q)-median(x(i+7,:)))/polyval(Z,max(x(i+7,:))-median(x(i+7,:)))];
p=polyfit([1:2:13],[x1 x3 x5 x7 x9 x11 x13],3);
q=mod(round(polyval(p,15)),160)+1;
MASTER2=[MASTER2 polyval(Z,x(i+14,q)-median(x(i+14,:)))/polyval(Z,max(x(i+14,:))-median(x(i+14,:)))];
p=polyfit([1:3:19],[x1 x4 x7 x10 x13 x16 x19],3);
q=mod(round(polyval(p,22)),160)+1;
MASTER3=[MASTER3 polyval(Z,x(i+21,q)-median(x(i+21,:)))/polyval(Z,max(x(i+21,:))-median(x(i+21,:)))];
end
% MASTER1(MASTER1<0)=[];
% MASTER2(MASTER2<0)=[];
% MASTER3(MASTER3<0)=[];