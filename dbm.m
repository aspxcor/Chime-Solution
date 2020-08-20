function SNR = dbm (filedir,filename)
%% 读入指定文件夹下数据集 计算SINR，wavedec去噪
    file_path = ['..\..\',filedir,'\'];
    dat_list = dir(strcat(file_path,'*.dat'));%获取该文件夹中所有dat格式的数据
    dat_num = length(dat_list);%获取数据总数量
    if dat_num > 0 %有满足条件的数据
        %dat_Matrix=zeros(40000,dat_num);
        SNR=zeros(1,dat_num);
        for i = 1:dat_num %逐一读取数据
            dat_name = dat_list(i).name;% 数据名		
            x=read_complex_binary(strcat(file_path,dat_name),Inf);
            BW = 1.25e5;
            Fs = BW;
%             x=read_complex_binary(filename,Inf);
            mod=sqrt(abs(x).^2);
            %plot(mod);
            sigNoisePower=sum(abs(x).^2)/length(x);
            [c,l]=wavedec(mod,3,'db1');
            [thr,sorh,keepapp]=ddencmp('den','wv',mod);
            s2=wdencmp('gbl',c,l,'db1',3,thr,sorh,keepapp);
            sigPower=sum(abs(s2).^2)/length(s2);
            % plot(sqrt(abs(s2).^2));
            NoisePower=sum(abs(mod-s2).^2)/length(mod-s2);
            SNR(1,i)=10*log10(sigPower/NoisePower);  
            %dat_Matrix(:,i)=x(:,1);
            save(filename,'SNR');
        end
    end
end