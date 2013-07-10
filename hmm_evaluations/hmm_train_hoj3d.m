actions=[1 5 9 10 16];

max_sample=2;
max_people=10;

num_frames=30;

path_to_dataset='C:\\Users\\Linder\\Documents\\features_3d_sources\\features_dataset\\hoj3d';

data=[];
group=[];
gIndex=1;

hmm=[];

for m=1:length(actions)
     for j=1:max_people
        for k=1:max_sample
            
            i=actions(m);
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
                actionMat= generateActionMatrix2(file,num_frames);
                IDX = kmeans(actionMat,15,'emptyaction','singleton');
                data=[data;IDX'];
                gIndex=gIndex+1;
            end
            
        end
     end
     
     Q=5;
     O=15;

     prior1 = normalise(rand(Q,1));
     transmat1 = mk_stochastic(rand(Q,Q));
     obsmat1 = mk_stochastic(rand(Q,O));

     [LL, prior2, transmat2, obsmat2] = dhmm_em(data, prior1, transmat1, obsmat1, 'max_iter', 5);
     
     hmm(m).prior=prior2;
     hmm(m).transmat=transmat2;
     hmm(m).obsmat=obsmat2;
     
end