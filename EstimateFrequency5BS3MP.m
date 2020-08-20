function chh12est = EstimateFrequency5BS3MP(a1,b1,a2,b2,a3,b3,frequency,alpha)
%UNTITLED33 Summary of this function goes here
%   Detailed explanation goes here
L2=[59.2912 0.01159 14.41];
L1=[-0.7902 7.3632 5.23029];
L3=[-8.37988 -32.3588 6.59];
L4=[-67.20 -25.207 27.339];
L5=[61.53 2.753 14.41];
LRef=[17.544 -10.353 0.9368];
z=1;
e=zeros(9,20);
d1=norm([a1 b1 z]-L1);
d2=norm([a1 b1 z]-L2);
d3=norm([a1 b1 z]-L3);
d4=norm([a1 b1 z]-L4);
d5=norm([a1 b1 z]-L5);
d1prime=norm([a2 b2 z]-L1);
d2prime=norm([a2 b2 z]-L2);
d3prime=norm([a2 b2 z]-L3);
d4prime=norm([a2 b2 z]-L4);
d5prime=norm([a2 b2 z]-L5);
d1primeprime=norm([a3 b3 z]-L1);
d2primeprime=norm([a3 b3 z]-L2);
d3primeprime=norm([a3 b3 z]-L3);
d4primeprime=norm([a3 b3 z]-L4);
d5primeprime=norm([a3 b3 z]-L5);
d1ref=norm(LRef-L1);
d2ref=norm(LRef-L2);
d3ref=norm(LRef-L3);
d4ref=norm(LRef-L4);
d5ref=norm(LRef-L5);
                  
                     e(1,1)=(1/(d1*d2))*exp(2*1j*pi*(d2-d2ref-d1+d1ref)*frequency/3e8);
                       e(1,2)=(1/(d2*d3))*exp(2*1j*pi*(d3-d3ref-d2+d2ref)*frequency/3e8);
                       e(1,3)=(1/(d3*d4))*exp(2*1j*pi*(d4-d4ref-d3+d3ref)*frequency/3e8);
                       e(1,4)=(1/(d4*d1))*exp(2*1j*pi*(d1-d1ref-d4+d4ref)*frequency/3e8);
                       e(1,5)=(1/(d2*d4))*exp(2*1j*pi*(d4-d4ref-d2+d2ref)*frequency/3e8);
                       e(1,6)=(1/(d1*d3))*exp(2*1j*pi*(d3-d3ref-d1+d1ref)*frequency/3e8);
                       e(1,7)=(1/(d2*d1))*exp(2*1j*pi*(d1-d1ref-d2+d2ref)*frequency/3e8);
                       e(1,8)=(1/(d3*d2))*exp(2*1j*pi*(d2-d2ref-d3+d3ref)*frequency/3e8);
                       e(1,9)=(1/(d4*d3))*exp(2*1j*pi*(d3-d3ref-d4+d4ref)*frequency/3e8);
                       e(1,10)=(1/(d1*d4))*exp(2*1j*pi*(d4-d4ref-d1+d1ref)*frequency/3e8);
                       e(1,11)=(1/(d4*d2))*exp(2*1j*pi*(d2-d2ref-d4+d4ref)*frequency/3e8);
                       e(1,12)=(1/(d3*d1))*exp(2*1j*pi*(d1-d1ref-d3+d3ref)*frequency/3e8);
                       
                       e(1,13)=(1/(d1*d5))*exp(2*1j*pi*(d5-d5ref-d1+d1ref)*frequency/3e8);
                       e(1,14)=(1/(d2*d5))*exp(2*1j*pi*(d5-d5ref-d2+d2ref)*frequency/3e8);
                       e(1,15)=(1/(d3*d5))*exp(2*1j*pi*(d5-d5ref-d3+d3ref)*frequency/3e8);
                       e(1,16)=(1/(d4*d5))*exp(2*1j*pi*(d5-d5ref-d4+d4ref)*frequency/3e8);
                       e(1,17)=(1/(d5*d1))*exp(2*1j*pi*(d1-d1ref-d5+d5ref)*frequency/3e8);
                       e(1,18)=(1/(d5*d2))*exp(2*1j*pi*(d2-d2ref-d5+d5ref)*frequency/3e8);
                       e(1,19)=(1/(d5*d3))*exp(2*1j*pi*(d3-d3ref-d5+d5ref)*frequency/3e8);
                       e(1,20)=(1/(d5*d4))*exp(2*1j*pi*(d4-d4ref-d5+d5ref)*frequency/3e8);

                     
                       e(2,1)=(1/(d1prime*d2))*exp(2*1j*pi*(d2-d2ref-d1prime+d1ref)*frequency/3e8);
                       e(2,2)=(1/(d2prime*d3))*exp(2*1j*pi*(d3-d3ref-d2prime+d2ref)*frequency/3e8);
                       e(2,3)=(1/(d3prime*d4))*exp(2*1j*pi*(d4-d4ref-d3prime+d3ref)*frequency/3e8);
                       e(2,4)=(1/(d4prime*d1))*exp(2*1j*pi*(d1-d1ref-d4prime+d4ref)*frequency/3e8);
                       e(2,5)=(1/(d2prime*d4))*exp(2*1j*pi*(d4-d4ref-d2prime+d2ref)*frequency/3e8);
                       e(2,6)=(1/(d1prime*d3))*exp(2*1j*pi*(d3-d3ref-d1prime+d1ref)*frequency/3e8);
                       e(2,7)=(1/(d2prime*d1))*exp(2*1j*pi*(d1-d1ref-d2prime+d2ref)*frequency/3e8);
                       e(2,8)=(1/(d3prime*d2))*exp(2*1j*pi*(d2-d2ref-d3prime+d3ref)*frequency/3e8);
                       e(2,9)=(1/(d4prime*d3))*exp(2*1j*pi*(d3-d3ref-d4prime+d4ref)*frequency/3e8);
                       e(2,10)=(1/(d1prime*d4))*exp(2*1j*pi*(d4-d4ref-d1prime+d1ref)*frequency/3e8);
                       e(2,11)=(1/(d4prime*d2))*exp(2*1j*pi*(d2-d2ref-d4prime+d4ref)*frequency/3e8);
                       e(2,12)=(1/(d3prime*d1))*exp(2*1j*pi*(d1-d1ref-d3prime+d3ref)*frequency/3e8);
                       
                       e(2,13)=(1/(d1prime*d5))*exp(2*1j*pi*(d5-d5ref-d1prime+d1ref)*frequency/3e8);
                       e(2,14)=(1/(d2prime*d5))*exp(2*1j*pi*(d5-d5ref-d2prime+d2ref)*frequency/3e8);
                       e(2,15)=(1/(d3prime*d5))*exp(2*1j*pi*(d5-d5ref-d3prime+d3ref)*frequency/3e8);
                       e(2,16)=(1/(d4prime*d5))*exp(2*1j*pi*(d5-d5ref-d4prime+d4ref)*frequency/3e8);
                       e(2,17)=(1/(d5prime*d1))*exp(2*1j*pi*(d1-d1ref-d5prime+d5ref)*frequency/3e8);
                       e(2,18)=(1/(d5prime*d2))*exp(2*1j*pi*(d2-d2ref-d5prime+d5ref)*frequency/3e8);
                       e(2,19)=(1/(d5prime*d3))*exp(2*1j*pi*(d3-d3ref-d5prime+d5ref)*frequency/3e8);
                       e(2,20)=(1/(d5prime*d4))*exp(2*1j*pi*(d4-d4ref-d5prime+d5ref)*frequency/3e8);

                     
                       
                       
                       e(3,1)=(1/(d1*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d1+d1ref)*frequency/3e8);
                       e(3,2)=(1/(d2*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d2+d2ref)*frequency/3e8);
                       e(3,3)=(1/(d3*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d3+d3ref)*frequency/3e8);
                       e(3,4)=(1/(d4*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d4+d4ref)*frequency/3e8);
                       e(3,5)=(1/(d2*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d2+d2ref)*frequency/3e8);
                       e(3,6)=(1/(d1*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d1+d1ref)*frequency/3e8);
                       e(3,7)=(1/(d2*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d2+d2ref)*frequency/3e8);
                       e(3,8)=(1/(d3*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d3+d3ref)*frequency/3e8);
                       e(3,9)=(1/(d4*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d4+d4ref)*frequency/3e8);
                       e(3,10)=(1/(d1*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d1+d1ref)*frequency/3e8);
                       e(3,11)=(1/(d4*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d4+d4ref)*frequency/3e8);
                       e(3,12)=(1/(d3*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d3+d3ref)*frequency/3e8);
                       
                       e(3,13)=(1/(d1*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d1+d1ref)*frequency/3e8);
                       e(3,14)=(1/(d2*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d2+d2ref)*frequency/3e8);
                       e(3,15)=(1/(d3*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d3+d3ref)*frequency/3e8);
                       e(3,16)=(1/(d4*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d4+d4ref)*frequency/3e8);
                       e(3,17)=(1/(d5*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d5+d5ref)*frequency/3e8);
                       e(3,18)=(1/(d5*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d5+d5ref)*frequency/3e8);
                       e(3,19)=(1/(d5*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d5+d5ref)*frequency/3e8);
                       e(3,20)=(1/(d5*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d5+d5ref)*frequency/3e8);

                      
                       
                       e(4,1)=(1/(d1prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d1prime+d1ref)*frequency/3e8);
                       e(4,2)=(1/(d2prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d2prime+d2ref)*frequency/3e8);
                       e(4,3)=(1/(d3prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d3prime+d3ref)*frequency/3e8);
                       e(4,4)=(1/(d4prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d4prime+d4ref)*frequency/3e8);
                       e(4,5)=(1/(d2prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d2prime+d2ref)*frequency/3e8);
                       e(4,6)=(1/(d1prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d1prime+d1ref)*frequency/3e8);
                       e(4,7)=(1/(d2prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d2prime+d2ref)*frequency/3e8);
                       e(4,8)=(1/(d3prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d3prime+d3ref)*frequency/3e8);
                       e(4,9)=(1/(d4prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d4prime+d4ref)*frequency/3e8);
                       e(4,10)=(1/(d1prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d1prime+d1ref)*frequency/3e8);
                       e(4,11)=(1/(d4prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d4prime+d4ref)*frequency/3e8);
                       e(4,12)=(1/(d3prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d3prime+d3ref)*frequency/3e8);
                       
                       
                       e(4,13)=(1/(d1prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d1prime+d1ref)*frequency/3e8);
                       e(4,14)=(1/(d2prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d2prime+d2ref)*frequency/3e8);
                       e(4,15)=(1/(d3prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d3prime+d3ref)*frequency/3e8);
                       e(4,16)=(1/(d4prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d4prime+d4ref)*frequency/3e8);
                       e(4,17)=(1/(d5prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d5prime+d5ref)*frequency/3e8);
                       e(4,18)=(1/(d5prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d5prime+d5ref)*frequency/3e8);
                       e(4,19)=(1/(d5prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d5prime+d5ref)*frequency/3e8);
                       e(4,20)=(1/(d5prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d5prime+d5ref)*frequency/3e8);

                       
                       
                       e(5,1)=(1/(d1primeprime*d2))*exp(2*1j*pi*(d2-d2ref-d1primeprime+d1ref)*frequency/3e8);
                       e(5,2)=(1/(d2primeprime*d3))*exp(2*1j*pi*(d3-d3ref-d2primeprime+d2ref)*frequency/3e8);
                       e(5,3)=(1/(d3primeprime*d4))*exp(2*1j*pi*(d4-d4ref-d3primeprime+d3ref)*frequency/3e8);
                       e(5,4)=(1/(d4primeprime*d1))*exp(2*1j*pi*(d1-d1ref-d4primeprime+d4ref)*frequency/3e8);
                       e(5,5)=(1/(d2primeprime*d4))*exp(2*1j*pi*(d4-d4ref-d2primeprime+d2ref)*frequency/3e8);
                       e(5,6)=(1/(d1primeprime*d3))*exp(2*1j*pi*(d3-d3ref-d1primeprime+d1ref)*frequency/3e8);
                       e(5,7)=(1/(d2primeprime*d1))*exp(2*1j*pi*(d1-d1ref-d2primeprime+d2ref)*frequency/3e8);
                       e(5,8)=(1/(d3primeprime*d2))*exp(2*1j*pi*(d2-d2ref-d3primeprime+d3ref)*frequency/3e8);
                       e(5,9)=(1/(d4primeprime*d3))*exp(2*1j*pi*(d3-d3ref-d4primeprime+d4ref)*frequency/3e8);
                       e(5,10)=(1/(d1primeprime*d4))*exp(2*1j*pi*(d4-d4ref-d1primeprime+d1ref)*frequency/3e8);
                       e(5,11)=(1/(d4primeprime*d2))*exp(2*1j*pi*(d2-d2ref-d4primeprime+d4ref)*frequency/3e8);
                       e(5,12)=(1/(d3primeprime*d1))*exp(2*1j*pi*(d1-d1ref-d3primeprime+d3ref)*frequency/3e8);
                       
                       e(5,13)=(1/(d1primeprime*d5))*exp(2*1j*pi*(d5-d5ref-d1primeprime+d1ref)*frequency/3e8);
                       e(5,14)=(1/(d2primeprime*d5))*exp(2*1j*pi*(d5-d5ref-d2primeprime+d2ref)*frequency/3e8);
                       e(5,15)=(1/(d3primeprime*d5))*exp(2*1j*pi*(d5-d5ref-d3primeprime+d3ref)*frequency/3e8);
                       e(5,16)=(1/(d4primeprime*d5))*exp(2*1j*pi*(d5-d5ref-d4primeprime+d4ref)*frequency/3e8);
                       e(5,17)=(1/(d5primeprime*d1))*exp(2*1j*pi*(d1-d1ref-d5primeprime+d5ref)*frequency/3e8);
                       e(5,18)=(1/(d5primeprime*d2))*exp(2*1j*pi*(d2-d2ref-d5primeprime+d5ref)*frequency/3e8);
                       e(5,19)=(1/(d5primeprime*d3))*exp(2*1j*pi*(d3-d3ref-d5primeprime+d5ref)*frequency/3e8);
                       e(5,20)=(1/(d5primeprime*d4))*exp(2*1j*pi*(d4-d4ref-d5primeprime+d5ref)*frequency/3e8);

                       
                       
                       e(6,1)=(1/(d1*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d1+d1ref)*frequency/3e8);
                       e(6,2)=(1/(d2*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d2+d2ref)*frequency/3e8);
                       e(6,3)=(1/(d3*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d3+d3ref)*frequency/3e8);
                       e(6,4)=(1/(d4*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d4+d4ref)*frequency/3e8);
                       e(6,5)=(1/(d2*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d2+d2ref)*frequency/3e8);
                       e(6,6)=(1/(d1*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d1+d1ref)*frequency/3e8);
                       e(6,7)=(1/(d2*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d2+d2ref)*frequency/3e8);
                       e(6,8)=(1/(d3*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d3+d3ref)*frequency/3e8);
                       e(6,9)=(1/(d4*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d4+d4ref)*frequency/3e8);
                       e(6,10)=(1/(d1*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d1+d1ref)*frequency/3e8);
                       e(6,11)=(1/(d4*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d4+d4ref)*frequency/3e8);
                       e(6,12)=(1/(d3*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d3+d3ref)*frequency/3e8);
                       
                       e(6,13)=(1/(d1*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d1+d1ref)*frequency/3e8);
                       e(6,14)=(1/(d2*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d2+d2ref)*frequency/3e8);
                       e(6,15)=(1/(d3*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d3+d3ref)*frequency/3e8);
                       e(6,16)=(1/(d4*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d4+d4ref)*frequency/3e8);
                       e(6,17)=(1/(d5*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d5+d5ref)*frequency/3e8);
                       e(6,18)=(1/(d5*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d5+d5ref)*frequency/3e8);
                       e(6,19)=(1/(d5*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d5+d5ref)*frequency/3e8);
                       e(6,20)=(1/(d5*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d5+d5ref)*frequency/3e8);

                       
                       
                       e(7,1)=(1/(d1primeprime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d1primeprime+d1ref)*frequency/3e8);
                       e(7,2)=(1/(d2primeprime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d2primeprime+d2ref)*frequency/3e8);
                       e(7,3)=(1/(d3primeprime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d3primeprime+d3ref)*frequency/3e8);
                       e(7,4)=(1/(d4primeprime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d4primeprime+d4ref)*frequency/3e8);
                       e(7,5)=(1/(d2primeprime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d2primeprime+d2ref)*frequency/3e8);
                       e(7,6)=(1/(d1primeprime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d1primeprime+d1ref)*frequency/3e8);
                       e(7,7)=(1/(d2primeprime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d2primeprime+d2ref)*frequency/3e8);
                       e(7,8)=(1/(d3primeprime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d3primeprime+d3ref)*frequency/3e8);
                       e(7,9)=(1/(d4primeprime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d4primeprime+d4ref)*frequency/3e8);
                       e(7,10)=(1/(d1primeprime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d1primeprime+d1ref)*frequency/3e8);
                       e(7,11)=(1/(d4primeprime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d4primeprime+d4ref)*frequency/3e8);
                       e(7,12)=(1/(d3primeprime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d3primeprime+d3ref)*frequency/3e8);
                       
                       
                       e(7,13)=(1/(d1primeprime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d1primeprime+d1ref)*frequency/3e8);
                       e(7,14)=(1/(d2primeprime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d2primeprime+d2ref)*frequency/3e8);
                       e(7,15)=(1/(d3primeprime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d3primeprime+d3ref)*frequency/3e8);
                       e(7,16)=(1/(d4primeprime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d4primeprime+d4ref)*frequency/3e8);
                       e(7,17)=(1/(d5primeprime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d5primeprime+d5ref)*frequency/3e8);
                       e(7,18)=(1/(d5primeprime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d5primeprime+d5ref)*frequency/3e8);
                       e(7,19)=(1/(d5primeprime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d5primeprime+d5ref)*frequency/3e8);
                       e(7,20)=(1/(d5primeprime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d5primeprime+d5ref)*frequency/3e8);

                       
                       e(8,1)=(1/(d1prime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d1prime+d1ref)*frequency/3e8);
                       e(8,2)=(1/(d2prime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d2prime+d2ref)*frequency/3e8);
                       e(8,3)=(1/(d3prime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d3prime+d3ref)*frequency/3e8);
                       e(8,4)=(1/(d4prime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d4prime+d4ref)*frequency/3e8);
                       e(8,5)=(1/(d2prime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d2prime+d2ref)*frequency/3e8);
                       e(8,6)=(1/(d1prime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d1prime+d1ref)*frequency/3e8);
                       e(8,7)=(1/(d2prime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d2prime+d2ref)*frequency/3e8);
                       e(8,8)=(1/(d3prime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d3prime+d3ref)*frequency/3e8);
                       e(8,9)=(1/(d4prime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d4prime+d4ref)*frequency/3e8);
                       e(8,10)=(1/(d1prime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d1prime+d1ref)*frequency/3e8);
                       e(8,11)=(1/(d4prime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d4prime+d4ref)*frequency/3e8);
                       e(8,12)=(1/(d3prime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d3prime+d3ref)*frequency/3e8);
                       
                       
                       e(8,13)=(1/(d1prime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d1prime+d1ref)*frequency/3e8);
                       e(8,14)=(1/(d2prime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d2prime+d2ref)*frequency/3e8);
                       e(8,15)=(1/(d3prime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d3prime+d3ref)*frequency/3e8);
                       e(8,16)=(1/(d4prime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d4prime+d4ref)*frequency/3e8);
                       e(8,17)=(1/(d5prime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d5prime+d5ref)*frequency/3e8);
                       e(8,18)=(1/(d5prime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d5prime+d5ref)*frequency/3e8);
                       e(8,19)=(1/(d5prime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d5prime+d5ref)*frequency/3e8);
                       e(8,20)=(1/(d5prime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d5prime+d5ref)*frequency/3e8);

                       
                       e(9,1)=(1/(d1primeprime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d1primeprime+d1ref)*frequency/3e8);
                       e(9,2)=(1/(d2primeprime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d2primeprime+d2ref)*frequency/3e8);
                       e(9,3)=(1/(d3primeprime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d3primeprime+d3ref)*frequency/3e8);
                       e(9,4)=(1/(d4primeprime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d4primeprime+d4ref)*frequency/3e8);
                       e(9,5)=(1/(d2primeprime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d2primeprime+d2ref)*frequency/3e8);
                       e(9,6)=(1/(d1primeprime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d1primeprime+d1ref)*frequency/3e8);
                       e(9,7)=(1/(d2primeprime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d2primeprime+d2ref)*frequency/3e8);
                       e(9,8)=(1/(d3primeprime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d3primeprime+d3ref)*frequency/3e8);
                       e(9,9)=(1/(d4primeprime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d4primeprime+d4ref)*frequency/3e8);
                       e(9,10)=(1/(d1primeprime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d1primeprime+d1ref)*frequency/3e8);
                       e(9,11)=(1/(d4primeprime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d4primeprime+d4ref)*frequency/3e8);
                       e(9,12)=(1/(d3primeprime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d3primeprime+d3ref)*frequency/3e8);
                       
                       
                       e(9,13)=(1/(d1primeprime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d1primeprime+d1ref)*frequency/3e8);
                       e(9,14)=(1/(d2primeprime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d2primeprime+d2ref)*frequency/3e8);
                       e(9,15)=(1/(d3primeprime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d3primeprime+d3ref)*frequency/3e8);
                       e(9,16)=(1/(d4primeprime*d5primeprime))*exp(2*1j*pi*(d5primeprime-d5ref-d4primeprime+d4ref)*frequency/3e8);
                       e(9,17)=(1/(d5primeprime*d1primeprime))*exp(2*1j*pi*(d1primeprime-d1ref-d5primeprime+d5ref)*frequency/3e8);
                       e(9,18)=(1/(d5primeprime*d2primeprime))*exp(2*1j*pi*(d2primeprime-d2ref-d5primeprime+d5ref)*frequency/3e8);
                       e(9,19)=(1/(d5primeprime*d3primeprime))*exp(2*1j*pi*(d3primeprime-d3ref-d5primeprime+d5ref)*frequency/3e8);
                       e(9,20)=(1/(d5primeprime*d4primeprime))*exp(2*1j*pi*(d4primeprime-d4ref-d5primeprime+d5ref)*frequency/3e8);

                      
chh12est=alpha*e;
end

