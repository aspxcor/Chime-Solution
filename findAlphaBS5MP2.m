function alpha = findAlphaBS5MP2(a1,b1,a2,b2,frequencies,chh12)
L1=[-0.7902 7.3632 5.23029];
L2=[59.2912 0.01159 14.41];
L3=[-8.37988 -32.3588 6.59];
L4=[-67.20 -25.207 27.339];
L5=[61.53 2.753 14.41];
LRef=[17.544 -10.353 0.9368];
z=1;
channelsPerFrequency=20;
e=zeros(9,20*length(frequencies));
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
d1ref=norm(LRef-L1);
d2ref=norm(LRef-L2);
d3ref=norm(LRef-L3);
d4ref=norm(LRef-L4);
d5ref=norm(LRef-L5);

  for F=1:length(frequencies)
                       e(1,(F-1)*channelsPerFrequency+1)=(1/(d1*d2))*exp(2*1j*pi*(d2-d2ref-d1+d1ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+2)=(1/(d2*d3))*exp(2*1j*pi*(d3-d3ref-d2+d2ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+3)=(1/(d3*d4))*exp(2*1j*pi*(d4-d4ref-d3+d3ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+4)=(1/(d4*d1))*exp(2*1j*pi*(d1-d1ref-d4+d4ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+5)=(1/(d2*d4))*exp(2*1j*pi*(d4-d4ref-d2+d2ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+6)=(1/(d1*d3))*exp(2*1j*pi*(d3-d3ref-d1+d1ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+7)=(1/(d2*d1))*exp(2*1j*pi*(d1-d1ref-d2+d2ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+8)=(1/(d3*d2))*exp(2*1j*pi*(d2-d2ref-d3+d3ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+9)=(1/(d4*d3))*exp(2*1j*pi*(d3-d3ref-d4+d4ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+10)=(1/(d1*d4))*exp(2*1j*pi*(d4-d4ref-d1+d1ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+11)=(1/(d4*d2))*exp(2*1j*pi*(d2-d2ref-d4+d4ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+12)=(1/(d3*d1))*exp(2*1j*pi*(d1-d1ref-d3+d3ref)*frequencies(F)/3e8);
                       
                       e(1,(F-1)*channelsPerFrequency+13)=(1/(d1*d5))*exp(2*1j*pi*(d5-d5ref-d1+d1ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+14)=(1/(d2*d5))*exp(2*1j*pi*(d5-d5ref-d2+d2ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+15)=(1/(d3*d5))*exp(2*1j*pi*(d5-d5ref-d3+d3ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+16)=(1/(d4*d5))*exp(2*1j*pi*(d5-d5ref-d4+d4ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+17)=(1/(d5*d1))*exp(2*1j*pi*(d1-d1ref-d5+d5ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+18)=(1/(d5*d2))*exp(2*1j*pi*(d2-d2ref-d5+d5ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+19)=(1/(d5*d3))*exp(2*1j*pi*(d3-d3ref-d5+d5ref)*frequencies(F)/3e8);
                       e(1,(F-1)*channelsPerFrequency+20)=(1/(d5*d4))*exp(2*1j*pi*(d4-d4ref-d5+d5ref)*frequencies(F)/3e8);

                       
                       e(2,(F-1)*channelsPerFrequency+1)=(1/(d1prime*d2))*exp(2*1j*pi*(d2-d2ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+2)=(1/(d2prime*d3))*exp(2*1j*pi*(d3-d3ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+3)=(1/(d3prime*d4))*exp(2*1j*pi*(d4-d4ref-d3prime+d3ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+4)=(1/(d4prime*d1))*exp(2*1j*pi*(d1-d1ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+5)=(1/(d2prime*d4))*exp(2*1j*pi*(d4-d4ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+6)=(1/(d1prime*d3))*exp(2*1j*pi*(d3-d3ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+7)=(1/(d2prime*d1))*exp(2*1j*pi*(d1-d1ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+8)=(1/(d3prime*d2))*exp(2*1j*pi*(d2-d2ref-d3prime+d3ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+9)=(1/(d4prime*d3))*exp(2*1j*pi*(d3-d3ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+10)=(1/(d1prime*d4))*exp(2*1j*pi*(d4-d4ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+11)=(1/(d4prime*d2))*exp(2*1j*pi*(d2-d2ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+12)=(1/(d3prime*d1))*exp(2*1j*pi*(d1-d1ref-d3prime+d3ref)*frequencies(F)/3e8);
                       
                       e(2,(F-1)*channelsPerFrequency+13)=(1/(d1prime*d5))*exp(2*1j*pi*(d5-d5ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+14)=(1/(d2prime*d5))*exp(2*1j*pi*(d5-d5ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+15)=(1/(d3prime*d5))*exp(2*1j*pi*(d5-d5ref-d3prime+d3ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+16)=(1/(d4prime*d5))*exp(2*1j*pi*(d5-d5ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+17)=(1/(d5prime*d1))*exp(2*1j*pi*(d1-d1ref-d5prime+d5ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+18)=(1/(d5prime*d2))*exp(2*1j*pi*(d2-d2ref-d5prime+d5ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+19)=(1/(d5prime*d3))*exp(2*1j*pi*(d3-d3ref-d5prime+d5ref)*frequencies(F)/3e8);
                       e(2,(F-1)*channelsPerFrequency+20)=(1/(d5prime*d4))*exp(2*1j*pi*(d4-d4ref-d5prime+d5ref)*frequencies(F)/3e8);

                       
                       e(3,(F-1)*channelsPerFrequency+1)=(1/(d1*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d1+d1ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+2)=(1/(d2*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d2+d2ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+3)=(1/(d3*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d3+d3ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+4)=(1/(d4*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d4+d4ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+5)=(1/(d2*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d2+d2ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+6)=(1/(d1*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d1+d1ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+7)=(1/(d2*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d2+d2ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+8)=(1/(d3*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d3+d3ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+9)=(1/(d4*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d4+d4ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+10)=(1/(d1*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d1+d1ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+11)=(1/(d4*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d4+d4ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+12)=(1/(d3*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d3+d3ref)*frequencies(F)/3e8);
                       
                       e(3,(F-1)*channelsPerFrequency+13)=(1/(d1*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d1+d1ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+14)=(1/(d2*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d2+d2ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+15)=(1/(d3*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d3+d3ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+16)=(1/(d4*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d4+d4ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+17)=(1/(d5*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d5+d5ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+18)=(1/(d5*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d5+d5ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+19)=(1/(d5*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d5+d5ref)*frequencies(F)/3e8);
                       e(3,(F-1)*channelsPerFrequency+20)=(1/(d5*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d5+d5ref)*frequencies(F)/3e8);

                      
                       e(4,(F-1)*channelsPerFrequency+1)=(1/(d1prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+2)=(1/(d2prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+3)=(1/(d3prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d3prime+d3ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+4)=(1/(d4prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+5)=(1/(d2prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+6)=(1/(d1prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+7)=(1/(d2prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+8)=(1/(d3prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d3prime+d3ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+9)=(1/(d4prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+10)=(1/(d1prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+11)=(1/(d4prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+12)=(1/(d3prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d3prime+d3ref)*frequencies(F)/3e8);
                       
                       
                       e(4,(F-1)*channelsPerFrequency+13)=(1/(d1prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d1prime+d1ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+14)=(1/(d2prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d2prime+d2ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+15)=(1/(d3prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d3prime+d3ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+16)=(1/(d4prime*d5prime))*exp(2*1j*pi*(d5prime-d5ref-d4prime+d4ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+17)=(1/(d5prime*d1prime))*exp(2*1j*pi*(d1prime-d1ref-d5prime+d5ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+18)=(1/(d5prime*d2prime))*exp(2*1j*pi*(d2prime-d2ref-d5prime+d5ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+19)=(1/(d5prime*d3prime))*exp(2*1j*pi*(d3prime-d3ref-d5prime+d5ref)*frequencies(F)/3e8);
                       e(4,(F-1)*channelsPerFrequency+20)=(1/(d5prime*d4prime))*exp(2*1j*pi*(d4prime-d4ref-d5prime+d5ref)*frequencies(F)/3e8);

                                         end

alpha=chh12*pinv(e);

end


