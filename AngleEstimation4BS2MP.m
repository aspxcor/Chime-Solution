function [out1,out2,out3,out4,goodness] = AngleEstimation4BS2MP(channels,xstart,xend,ystart,yend,frequencies,minDistance,maxDistance,stepSize)

%channels=1x4 matrix;h(jk,conj)1*n^2
%alpha=1x2 matrix
%e = 2x4 matrix
L2=[59.2912 0.01159 14.41];
L1=[-0.7902 7.3632 5.23029];
L3=[-8.37988 -32.3588 6.59];
L4=[-67.20 -25.207 27.339];
LRef=[17.544 -10.353 0.9368];
z=1;
numChannels=length(channels);

%channels=1x4 matrix
%alpha=1x2 matrix
%e = 2x4 matrix
L2=[59.2912 0.01159 14.41];
L1=[-0.7902 7.3632 5.23029];
L3=[-8.37988 -32.3588 6.59];
L4=[-67.20 -25.207 27.339];
LRef=[17.544 -10.353 0.9368];
z=1;
numChannels=length(channels);
goodness=zeros(ceil((xend-xstart+1)),ceil((yend-ystart+1)),ceil((xend-xstart+1)*stepSize),ceil((yend-ystart+1)*stepSize));
channelsPerFrequency=round(numChannels/length(frequencies));
multiPath=2;
d1ref=norm(LRef-L1);
d2ref=norm(LRef-L2);
d3ref=norm(LRef-L3);
d4ref=norm(LRef-L4);
e=zeros(multiPath^2,numChannels);
for a1=xstart+5:10:xend-5
    for b1=ystart+5:10:yend-5
       d1=norm([a1 b1 z]-L1);
                   d2=norm([a1 b1 z]-L2);
                   d3=norm([a1 b1 z]-L3);
                   d4=norm([a1 b1 z]-L4);
        for a2=a1-5:stepSize:a1+5
            for b2=b1-5:stepSize:b1+5
                
                   d1prime=norm([a2 b2 z]-L1);
                   d2prime=norm([a2 b2 z]-L2);
                   d3prime=norm([a2 b2 z]-L3);
                   d4prime=norm([a2 b2 z]-L4);

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
                                          end
                   alpha1=channels*pinv(e);
                   goodness(round((a1-xstart))+1,round((b1-ystart))+1,round((a2-xstart)/stepSize)+1,round((b2-ystart)/stepSize)+1)=(1/norm(channels-alpha1*e));
                
            end
        end
    end
end
[maxval, maxidx] = max(goodness(:));
[out1, out2, out3, out4] = ind2sub( size(goodness), maxidx );
out1=out1+xstart-1;
out2=out2+ystart-1;
out3=out3*stepSize+xstart-stepSize;
out4=out4*stepSize+ystart-stepSize;
end

