max_action=2;
max_people=10;
max_doc=1;

num_frames=40;

path_to_dataset='C:\\Users\\Linder\\Documents\\features_3d_sources\\features_dataset\\hoj3d';

data=[];
group=[];
gIndex=1;
for i=1:max_doc
    for j=1:max_people
        for k=1:max_action
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
                data=[data; generateActionMatrix(file,num_frames)];
                gIndex=gIndex+1;
            end
            
            
        end
    end
end

max_action=2;
max_people=10;
max_doc=5;

notData=[];
nGroup=[];
nGIndex=1;
for i=2:max_doc
    for j=1:max_people
        for k=1:max_action
            
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
                notData=[notData; generateActionMatrix(file,num_frames)];
                nGIndex=nGIndex+1;
            end
        end
    end
end

group=ones(gIndex-1,1);
nGroup=zeros(nGIndex-1,1);

group=[group; nGroup];

data=[data;notData];
data=double(data);
svmStruct = svmtrain(data,group);