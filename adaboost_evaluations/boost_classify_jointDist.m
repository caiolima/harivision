load boost_jointdist_act2

result=[];

action=3;

max_sample=3;
max_people=10;
max_action=action+7;

num_frames=30;

path_to_dataset='C:\\Users\\ivision\\Documents\\features_dataset\\joint_dist';

cont=1;
testes=[];
for i=action:max_action
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
            
            file = sprintf('%s\\a%s_s%s_e0%d__jointDist.txt',path_to_dataset,s_i,s_j,k);
            
            if exist(file, 'file')
                mat=double(generateActionMatrix(file,num_frames));
                
                testes=[testes;mat];
                %result = [result; svmclassify(svmStruct,mat)];
                
                %disp(sprintf('a%s_s%s_e0%d: %d\n',s_i,s_j,k,result(cont)));
                %cont=cont+1;
            end
        end
    end
end

classificador.train(data,group)
a = classificador.predict(testes, 'ReturnSum', true);