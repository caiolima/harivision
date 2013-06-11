load svm_hoj3d_act1


result=[];

max_sample=3;
max_people=10;
max_action=8;

num_frames=40;

path_to_dataset='C:\\Users\\Linder\\Documents\\features_3d_sources\\features_dataset\\hoj3d';

cont=1;
for i=1:max_action
    for j=1:max_people
        for k=3:max_sample
            s_i=sprintf('0%d',i);
            s_j=sprintf('0%d',j);
            
            if(i>9)
                s_i=sprintf('%d',i);
            end
            
            if(j>9)
                s_j=sprintf('%d',j);
            end
            
            file = sprintf('%s\\a%s_s%s_e0%d__hoj3d.txt',path_to_dataset,s_i,s_j,k);
            
            if exist(file, 'file')
                mat=double(generateActionMatrix(file,num_frames));
                
                result = [result; svmclassify(svmStruct,mat)];
                
                disp(sprintf('a%s_s%s_e0%d: %d\n',s_i,s_j,k,result(cont)));
                cont=cont+1;
            end
        end
    end
end