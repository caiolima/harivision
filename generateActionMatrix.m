function matrix = generateActionMatrix( file ,n_frames)


mFile=fopen(file,'r');
if(not(mFile==-1))
    
    matrix=[];
    lastDimention=[];
    for i=1:n_frames
        line=fgets(mFile);
        ActionFrame=[];
        if(line==-1)  
            ActionFrame=zeros(1,lastDimention(1)*lastDimention(2));
        else
            dimension=sscanf(line,'%f %f');
            
            
            for j=1:dimension(1)
                line=fgets(mFile);
                strIn='';
                for k=1:dimension(2)
                    strIn=strcat(strIn,'%d');
                end
                ActionFrame=[ActionFrame textscan(line, strIn, 'delimiter', ' ')];
                ActionFrame=cell2mat(ActionFrame);
            end
            lastDimention=dimension;
        end
        matrix=horzcat(matrix, ActionFrame);
        
    end
else
    matrix=[];
end
fclose(mFile);
end



