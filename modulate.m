function LoRaOut = LoRa_Modulation(SF,BW,Fs,num_sam,symbol,inverse)
    %% Modulate LoRa symbols
    phase = 0;
    Frequency_Offset = (Fs/2) - (BW/2);
    shift = symbol;
    LoRaOut = zeros(1,num_sam);
    for k=1:num_sam
        LoRaOut(k) = cos(phase) + 1i*sin(phase);
        f = BW*shift/(2^SF);
        if(inverse == 1)
               f = BW - f;
        end
        f = f + Frequency_Offset;
        phase = phase + 2*pi*f/Fs;
        if phase > pi
            phase = phase - 2*pi;
        end
        shift = shift + BW/Fs;
        if shift >= (2^SF)
            shift = shift - 2^SF;
        end
    end
end