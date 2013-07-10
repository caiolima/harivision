load hmm_hoj3d_actions

result=[];
actions=[1 5 9 10 16];

max_sample=3;
max_people=10;

num_frames=30;

path_to_dataset='C:\\Users\\Linder\\Documents\\features_3d_sources\\features_dataset\\hoj3d';

cont=1;
testes=[];
groupTeste=[];
countG=1;
for m=1:length(actions)
    for j=1:max_people
        for k=3:max_sample
            i=actions(m);
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
            
            file = sprintf('%s\\a%s_s%s_e0%d__hoj3d.txt',path_to_dataset,s_i,s_j,k);
            
            if exist(file, 'file')
                
                
                groupTeste=[groupTeste;1];
                countG=countG+1;
               
                mat=double(generateActionMatrix2(file,num_frames));
                IDX = kmeans(mat,15,'emptyaction','singleton');
                
                mll = dhmm_logprob(IDX',prior2, transmat2, obsmat2);
                %result = [result; svmclassify(svmStruct,mat)];
                
                %disp(sprintf('a%s_s%s_e0%d: %d\n',s_i,s_j,k,result(cont)));
                %cont=cont+1;
            end
        end
    end
end