function p1 = inputsample(sigfile1,sigfile2,sigfile3,sigfile4,extra_sampling_factor,BW,sig_size)
    Fs = BW;
    symbol_length=sig_size;
    symbol_length_upsampled = extra_sampling_factor*sig_size;
    freq_shift_per_sample =  Fs/symbol_length; % How each frequency bin maps to a difference in frequency
    Ts = 1/freq_shift_per_sample; % Symbol Duration
    f = linspace(-BW/2,BW/2-freq_shift_per_sample,symbol_length); % The X-Axis
    reset_freq = -BW/2; % The initial frequency of the base chirp
    final_freq = (BW/2)-freq_shift_per_sample; % The final frequency
    [up,down] =  my_create_chirpspecial(extra_sampling_factor*Fs,Ts,reset_freq,final_freq,sig_size);
    upfft=fft(up);
    downfft=fft(down);
    up250=(ifft([upfft(1:512);zeros(1024,1);upfft(513:1024)]));
    down250=(ifft([downfft(1:512);zeros(1024,1);downfft(513:1024)]));
    sig1=read_complex_binary(sigfile1);
    sig2=read_complex_binary(sigfile2);
    sig3=read_complex_binary(sigfile3);
    sig4=read_complex_binary(sigfile4);
    p1=getPacket(sig1,down250,up250);
    p2=getPacket(sig2,down250,up250);
    p3=getPacket(sig3,down250,up250);
    p4=getPacket(sig4,down250,up250);
    close all;
    figure; hold on;
    plot(abs(p1+p2+p3+p4),'Color','black');
    plot(abs(p1),'Color','blue')
    plot(abs(p2),'Color','blue')
    plot(abs(p3),'Color','blue')
    plot(abs(p4),'Color','blue')
    p2=OffsetCorrectorNew(p2,p1);
    p3=OffsetCorrectorNew(p3,p1);
    p4=OffsetCorrectorNew(p4,p1);
    plot(abs(p1+p2+p3+p4),'Color','red')
    tic
    pMASTER=p1+p2+p3+p4;
    toc
end