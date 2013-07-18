load hmm_hoj3d_actions

result=[];
actions=[1 5 9 10 16];

max_sample=3;
max_people=10;

num_frames=30;

path_to_dataset='C:\\Users\\Linder\\Documents\\features_3d_sources\\features_dataset\\hoj3d';

cont=1;
testes=[];
countG=1;



for m=1:length(actions)
    for j=1:max_people
        for k=1:max_sample
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
               
                testes=[testes; i];
                
                mat=double(generateActionMatrix2(file,num_frames));
                IDX = kmeans(mat,15,'emptyaction','singleton');
                
                max_act=dhmm_logprob(IDX',hmm(1).prior, hmm(1).transmat, hmm(1).obsmat);
                act_pos=1
                for act_i=2:length(actions)
                    mll=dhmm_logprob(IDX',hmm(act_i).prior, hmm(act_i).transmat, hmm(act_i).obsmat);
                   if mll > max_act
                      max_act=mll;
                      act_pos=act_i;  
                   end    
                end
                result = [result; act_pos];
                
                %disp(sprintf('a%s_s%s_e0%d: %d\n',s_i,s_j,k,result(cont)));
                %cont=cont+1;
            end
        end
    end
end
R=result==testes;

pct_right=sum(R)/length(testes)


