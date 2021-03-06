function chh12est = EstimateFrequency6BS2MP(a1,b1,a2,b2,frequency,alpha)
%UNTITLED33 Summary of this function goes here
%   Detailed explanation goes here
L2=[59.2912 0.01159 14.41];
L1=[-0.7902 7.3632 5.23029];
L3=[-8.37988 -32.3588 6.59];
L4=[-67.20 -25.207 27.339];
L5=[61.53 2.753 14.41];
L6=[60.37 1.286 14.41];
LRef=[17.544 -10.353 0.9368];
z=1;
e=zeros(4,20);
d1=norm([a1 b1 z]-L1);
d2=norm([a1 b1 z]-L2);
d3=norm([a1 b1 z]-L3);
d4=norm([a1 b1 z]-L4);
d5=norm([a1 b1 z]-L5);
d6=norm([a1 b1 z]-L6);
d1prime=norm([a2 b2 z]-L1);
d2prime=norm([a2 b2 z]-L2);
d3prime=norm([a2 b2 z]-L3);
d4prime=norm([a2 b2 z]-L4);
d5prime=norm([a2 b2 z]-L5);
d6prime=norm([a2 b2 z]-L6);

d1ref=norm(LRef-L1);
d2ref=norm(LRef-L2);
d3ref=norm(LRef-L3);
d4ref=norm(LRef-L4);
d5ref=norm(LRef-L5);
d6ref=norm(LRef-L6);
                  
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

                       e(1,21)=(1/(d1*d6))*exp(2*1j*pi*(d6-d6ref-d1+d1ref)*frequency/3e8);
                       e(1,22)=(1/(d2*d6))*exp(2*1j*pi*(d6-d6ref-d2+d2ref)*frequency/3e8);
                       e(1,23)=(1/(d3*d6))*exp(2*1j*pi*(d6-d6ref-d3+d3ref)*frequency/3e8);
                       e(1,24)=(1/(d4*d6))*exp(2*1j*pi*(d6-d6ref-d4+d4ref)*frequency/3e8);
                       e(1,25)=(1/(d5*d6))*exp(2*1j*pi*(d6-d6ref-d5+d5ref)*frequency/3e8);
                       e(1,26)=(1/(d6*d1))*exp(2*1j*pi*(d1-d1ref-d6+d6ref)*frequency/3e8);
                       e(1,27)=(1/(d6*d2))*exp(2*1j*pi*(d2-d2ref-d6+d6ref)*frequency/3e8);
                       e(1,28)=(1/(d6*d3))*exp(2*1j*pi*(d3-d3ref-d6+d6ref)*frequency/3e8);
                       e(1,29)=(1/(d6*d4))*exp(2*1j*pi*(d4-d4ref-d6+d6ref)*frequency/3e8);
                       e(1,30)=(1/(d6*d5))*exp(2*1j*pi*(d5-d5ref-d6+d6ref)*frequency/3e8);


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

                       e(2,21)=(1/(d1prime*d6))*exp(2*1j*pi*(d6-d6ref-d1prime+d1ref)*frequency/3e8);
                       e(2,22)=(1/(d2prime*d6))*exp(2*1j*pi*(d6-d6ref-d2prime+d2ref)*frequency/3e8);
                       e(2,23)=(1/(d3prime*d6))*exp(2*1j*pi*(d6-d6ref-d3prime+d3ref)*frequency/3e8);
                       e(2,24)=(1/(d4prime*d6))*exp(2*1j*pi*(d6-d6ref-d4prime+d4ref)*frequency/3e8);
                       e(2,25)=(1/(d5prime*d6))*exp(2*1j*pi*(d6-d6ref-d5prime+d5ref)*frequency/3e8);
                       e(2,26)=(1/(d6prime*d1))*exp(2*1j*pi*(d1-d1ref-d6prime+d6ref)*frequency/3e8);
                       e(2,27)=(1/(d6prime*d2))*exp(2*1j*pi*(d2-d2ref-d6prime+d6ref)*frequency/3e8);
                       e(2,28)=(1/(d6prime*d3))*exp(2*1j*pi*(d3-d3ref-d6prime+d6ref)*frequency/3e8);
                       e(2,29)=(1/(d6prime*d4))*exp(2*1j*pi*(d4-d4ref-d6prime+d6ref)*frequency/3e8);
                       e(2,30)=(1/(d6prime*d5))*exp(2*1j*pi*(d5-d5ref-d6prime+d6ref)*frequency/3e8);
                       
                       
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

                       e(3,21)=(1/(d1*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d1+d1ref)*frequency/3e8);
                       e(3,22)=(1/(d2*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d2+d2ref)*frequency/3e8);
                       e(3,23)=(1/(d3*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d3+d3ref)*frequency/3e8);
                       e(3,24)=(1/(d4*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d4+d4ref)*frequency/3e8);
                       e(3,25)=(1/(d5*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d5+d5ref)*frequency/3e8);
                       e(3,26)=(1/(d6*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d6+d6ref)*frequency/3e8);
                       e(3,27)=(1/(d6*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d6+d6ref)*frequency/3e8);
                       e(3,28)=(1/(d6*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d6+d6ref)*frequency/3e8);
                       e(3,29)=(1/(d6*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d6+d6ref)*frequency/3e8);
                       e(3,30)=(1/(d6*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d6+d6ref)*frequency/3e8);
                       
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

                       e(4,21)=(1/(d1prime*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d1prime+d1ref)*frequency/3e8);
                       e(4,22)=(1/(d2prime*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d2prime+d2ref)*frequency/3e8);
                       e(4,23)=(1/(d3prime*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d3prime+d3ref)*frequency/3e8);
                       e(4,24)=(1/(d4prime*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d4prime+d4ref)*frequency/3e8);
                       e(4,25)=(1/(d5prime*d6prime))*exp(2*1j*pi*(d6prime-d6ref-d5prime+d5ref)*frequency/3e8);
                       e(4,26)=(1/(d6prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d6prime+d6ref)*frequency/3e8);
                       e(4,27)=(1/(d6prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d6prime+d6ref)*frequency/3e8);
                       e(4,28)=(1/(d6prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d6prime+d6ref)*frequency/3e8);
                       e(4,29)=(1/(d6prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d6prime+d6ref)*frequency/3e8);
                       e(4,30)=(1/(d6prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d6prime+d6ref)*frequency/3e8);
                       
                                           
chh12est=alpha*e;
end

