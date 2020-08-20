clc;clear all;close all
load 'data_to_import\totalData.mat'
%% Fig 12 SINR Goodness-of-Fit: CDF of predicted vs. actual SINR across base stations

figure(12)
cdfplot(BS42(:,1))
hold on
cdfplot(BS52(:,1))
hold on
cdfplot(BS62(:,1))
hold on
cdfplot(BS64(:,1))
grid on
set(gca,'XTick',[0:2:12]);
set(gca,'YTick',[0:0.2:1]);
legend('4 BS 2 MP','5 BS 2 MP','6 BS 2 MP','6 BS 4 MP','location','southeast')
title('')
ylabel('CDF (Error in prediction of SINR)')
xlabel('Error in predicted SINR (in dB)')

%% Fig 13

% Fig 13.1 (left) Gain in SINR(dB) by using Chime vs. median frequency of operation
figure(13)
subplot(1,2,1)
barwitherr([gain_std(1)], [1],[gain_Mean(1)],[0.1],'b')
hold on
barwitherr([gain_std(2:4)'], [2 3 4],[gain_Mean(2:4)'],'r')
axis([0.01 5 0 5])
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[0:2:4]);
set(gca,'xticklabel',{'0','1','4','5','6'});
ylabel('Gain (in dB)')
xlabel('Number of base stations')

% Fig 13.2 (right) Battery life of Chime vs. temporal interpolation technique
subplot(1,2,2)
barwitherr([life_std(1)'],[life_Mean(1)'],'b')
hold on
barwitherr([life_std(2:4)'], [2 3 4],[life_Mean(2:4)'],'r')
axis([0.01 5 0 100])
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[0:20:100]);
set(gca,'xticklabel',{'0','1','4','5','6'});
ylabel('Battery Life (% of optimum)')
xlabel('Number of base stations')

%% Fig 14 Gain in battery life across # messages per hour: Battery life increases 1.4-5.7 years for LP-WAN clients

figure(14)
H(1) = plot(1:4,cal_battery_life_year(1,:),'-b','linewidth',1.5);
hold on
std_bly=[0 std(cal_battery_life_year(1,:)')/4 std(cal_battery_life_year(1,:)')/4 std(cal_battery_life_year(1,:)')/4];
H(2) = errorbar(cal_battery_life_year(1,:),std_bly,'-b','linewidth',1.5);
hold on
H(3) = plot(1:4,cal_battery_life_year(2,:),'-r','linewidth',1.5);
hold on
std_bly=[0 std(cal_battery_life_year(2,:)')/4 std(cal_battery_life_year(2,:)')/4 std(cal_battery_life_year(2,:)')/4];
H(4) = errorbar(cal_battery_life_year(2,:),std_bly,'-r','linewidth',1.5);
hold on
H(5) = plot(1:4,cal_battery_life_year(3,:),'-m','linewidth',1.5);
hold on
std_bly=[0 std(cal_battery_life_year(3,:)')/4 std(cal_battery_life_year(3,:)')/4 std(cal_battery_life_year(3,:)')/4];
H(6) = errorbar(cal_battery_life_year(3,:),std_bly,'-m','linewidth',1.5);
hold on
legend(H([1 3 5]),'5','10','15','location','northwest');
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[0:2:10]);
set(gca,'xticklabel',{'0','1','4','5','6'});
axis([0.5 4.5 0 10])
grid on
ylabel('Battery Life (in years)')
xlabel('Number of base stations')

%% Fig 15 Gain in SINR and improvement in datarate vs. interpolation for # of frequencies used for training
% (1)

figure(15)
subplot(2,1,1)
% colormap
barwitherr([Intepolation1_std' Chime1_std'], [1 2 3 4],[Intepolation1_Mean' Chime1_Mean']);
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[0:1:4]);
axis([0.5 4.5 0 5])
ylabel('Gain (in dB)')
legend('Interpolation','Chime','location','northwest')

% (2)

subplot(2,1,2)
barwitherr([Intepolation2_std' Chime2_std'], [1 2 3 4],[Intepolation2_Mean' Chime2_Mean'])
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[0:1:4]);
axis([0.5 4.5 0 5])
set(gca,'yticklabel',{'0x','1x','2x','3x','4x'});
ylabel('Increase in datarate')
xlabel('Number of frequencies')
legend('Interpolation','Chime','location','northwest')

%% Fig 16 Chime + Charm: Improvement in Gain(dB) when Charm is assisted by Chime

figure(16)
barwitherr([Charm_std' Charm_Chime_std'], [1 2 3],[Charm_Mean' Charm_Chime_Mean'])
set(gca,'XTick',[0:1:3]);
set(gca,'YTick',[0:1:6]);
axis([0.5 3.5 0 6])
set(gca,'xticklabel',{'0','4','5','6'});
ylabel('Gain (in dB)')
xlabel('Number of base stations')
legend('Charm','Charm+Chime','location','northwest')

%% Fig 17 Nulling of unwanted interference leads to improved data rate for legitimate client with Chime

figure(17)
yyaxis left
K(1) = barwitherr([IN_std'], [0.9 1.9 2.9 3.9],[INR_Mean'],0.15,'b');
hold on
K(2) = barwitherr([Data_std'], [1.1 2.1 3.1 4.1],[Data_Mean'],0.15,'r');
hold on
ylabel('INR of client (in dB)');
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[-3:1:6]);
axis([0.5 4.5 -3 5])

yyaxis right
set(gca,'YTick',[0:1:6]);
set(gca,'yticklabel',{'0x','1x','2x','3x','4x','5x'});
axis([0.5 4.5 -3 5]);
set(gca,'xticklabel',{'0','1','4','5','6'});
ylabel('Datarate of legitimate client');
xlabel('Number of base stations');
legend(K([1 2]),'INR ration','Datarate','location','northwest');