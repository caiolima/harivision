load svm_jointdist_act16

result=[];

action=16;

max_sample=3;
max_people=10;
max_action=action+7;

num_frames=30;

path_to_dataset='C:\\Users\\Linder\\Documents\\features_3d_sources\\features_dataset\\joint_dist';

cont=1;
testes=[];
groupTeste=[];
countG=1;
for i=action:max_action
    for j=1:max_people
        for k=3:max_sample
            
            auxi=mod(i,20);
            if(auxi==0)
                auxi=20;
            end
            s_i=sprintf('0%d',auxi);
            s_j=sprintf('0%d',j);
            
            if(auxi>9)
                s_i=sprintf('%d',auxi);
            end
            
            if(j>9)
                s_j=sprintf('%d',j);
            end
            
            file = sprintf('%s\\a%s_s%s_e0%d__jointDist.txt',path_to_dataset,s_i,s_j,k);
            
            if exist(file, 'file')
                
                if(countG<=9)
                    groupTeste=[groupTeste;1];
                    countG=countG+1;
                else
                    groupTeste=[groupTeste;0];
                    countG=countG+1;
                end
                
                mat=double(generateActionMatrix(file,num_frames));
                
                testes=[testes;mat];
                %result = [result; svmclassify(svmStruct,mat)];
                
                %disp(sprintf('a%s_s%s_e0%d: %d\n',s_i,s_j,k,result(cont)));
                %cont=cont+1;
            end
        end
    end
end

[out, accuracy, a] = svmpredict(groupTeste, testes, svmLearn);