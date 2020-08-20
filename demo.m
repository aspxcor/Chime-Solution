%% Demo of using the Algorithm of Chime
%% Demo of import the data
clc;clear all;close all
load data.mat
% addpath MSampleCode
namelist = dir('datamultipathDowntown/*.dat');
data = read_complex_binary(['datamultipathDowntown/',namelist(54).name]);

%% Demo of read the complex binary data
for i=12:17
    data = [data;read_complex_binary(['datamultipathDowntown/',namelist(i).name])];
end

%% Demo of Chirp Detection
start=67;
ender=500;

loc1 = chirpDetect(data,start,ender);

%% Demo of Angle Estimation
channels = 1:36;
xstart = 1;
xend = 100;
ystart = 1;
yend =100;
minDistance = 5;
maxDistance =25;
stepSize = 2;
frequency = 128;
[a142,b142,a242,b242,goodness42] = AngleEstimation4BS2MP(channels(1:16),xstart,xend,ystart,yend,frequency,minDistance,maxDistance,stepSize);
[a152,b152,a252,b252,goodness52] = AngleEstimation5BS2MP(channels(1:25),xstart,xend,ystart,yend,frequency,minDistance,maxDistance,stepSize);
[a153,b153,a253,b253,a353,b353,goodness53] = AngleEstimation5BS3MP(channels(1:25),xstart,xend,ystart,yend,frequency,minDistance,maxDistance,stepSize);
[a162,b162,a262,b262,goodness62] = AngleEstimation6BS2MP(channels,xstart,xend,ystart,yend,frequency,minDistance,maxDistance,stepSize);
[a164,b164,a264,b264,a364,b364,a464,b464,goodness64] = AngleEstimation6BS4MP(channels,xstart,xend,ystart,yend,frequency,minDistance,maxDistance,stepSize);

%% Demo of Finding the Alpha
% channels=1x4 matrix
% alpha=1x2 matrix
% e = 2x4 matrix
alpha = 0.5

% alpha42 = findAlphaBS4MP2(a142,b142,a242,b242,frequency,chh1242);
% alpha52 = findAlphaBS5MP2(a152,b152,a252,b252,frequency,chh1252);
% alpha53 = findAlphaBS5MP3(a153,b153,a253,b253,a353,b353,frequency,chh1253);
% alpha62 = findAlphaBS6MP2(a162,b162,a262,b262,frequency,chh1262);
% alpha64 = findAlphaBS6MP4(a164,b164,a264,b264,a364,b364,a464,b464,frequency,chh1264);

alpha42 = findAlphaBS4MP2(a142,b142,a242,b242,frequency,channels(1:12));
alpha52 = findAlphaBS5MP2(a152,b152,a252,b252,frequency,channels(1:20));
alpha53 = findAlphaBS5MP3(a153,b153,a253,b253,a353,b353,frequency,channels(1:20));
alpha62 = findAlphaBS6MP2(a162,b162,a262,b262,frequency,channels(1:30));
alpha64 = findAlphaBS6MP4(a164,b164,a264,b264,a364,b364,a464,b464,frequency,channels(1:30));

%% Demo of Estimating the Frequency
chh1242 = EstimateFrequency4BS2MP(a142,b142,a242,b242,frequency,alpha42);
chh1252 = EstimateFrequency5BS2MP(a152,b152,a252,b252,frequency,alpha52);
chh1253 = EstimateFrequency5BS3MP(a153,b153,a253,b253,a353,b353,frequency,alpha53);
chh1262 = EstimateFrequency6BS2MP(a162,b162,a262,b262,frequency,alpha62);
chh1264 = EstimateFrequency6BS4MP(a164,b164,a264,b264,a364,b364,a464,b464,frequency,alpha64);

%% Misc Demo
chhmean=mean(mean(chh1242));
alphamean=mean(mean(alpha42));
alphastd=std(std(alpha42));