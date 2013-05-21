max_action=3
max_people=10
max_doc=1

data=[];
notData=[];
group=[];
nGroup=[];
offset=2;
gIndex=1;
nGIndex=1;
for i=1:max_doc
    for j=1:max_people
        for k=1:max_action
            if(offset>20)
                offset=2;
            end
            s_i=sprintf('0%d',i);
            s_j=sprintf('0%d',j);
            s_offset=sprintf('0%d',offset);
            
            if(i>9)
                s_i=sprintf('%d',i);
            end
            
            if(j>9)
               s_j=sprintf('%d',j);
            end
            
            if(offset>9)
                s_offset=sprintf('%d',offset);
            end
            
            file = sprintf('/Users/caio/dataset/features_dataset/hoj3d/a%s_s%s_e0%d__hoj3d.txt',s_i,s_j,k);
            file2 = sprintf('/Users/caio/dataset/features_dataset/hoj3d/a%s_s%s_e0%d__hoj3d.txt',s_offset,s_j,k);
            
            if exist(file, 'file')
                data=[data; generateActionMatrix(file,30)];
                gIndex=gIndex+1;
            end
            
            if exist(file2, 'file')
                notData=[notData; generateActionMatrix(file2,30)];
                nGIndex=nGIndex+1;
            end
            offset=offset+1;
        end
    end
end

group=ones(gIndex-1,1);
nGroup=zeros(nGIndex-1,1);

group=[group; nGroup];

data=[data;notData];
data=double(data);
svmStruct = svmtrain(data,group);