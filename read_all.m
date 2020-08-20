% function dat_Matrix = read_all (file_path)
% file_path = '..\..\datamultipathDowntown\';
file_path = '..\..\datamultipathDowntown\';
dat_list = dir(strcat(file_path,'*.dat'));%获取该文件夹中所有dat文件
dat_num = length(dat_list);%获取dat文件总数量
if dat_num > 0 %有满足条件的dat文件
    dat_Matrix=zeros(40000,dat_num);
	for i = 1:dat_num %逐一读取dat文件
		dat_name = dat_list(i).name;		
        dat_read=read_complex_binary(strcat(file_path,dat_name),Inf);
        dat_Matrix(:,i)=dat_read(:,1);
    end
end