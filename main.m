
max_action=3
max_people=10
max_doc=1

minFrames=100;

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
            
            file = sprintf('C:\\Users\\Linder\\Documents\\dataset\\skeletons\\MSRAction3DSkeleton(20joints)\\a%s_s%s_e0%d_skeleton.txt',s_i,s_j,k)
           
            nFrames=readSkeletonDataset(file',@plot_skeleton);
            if(nFrames>0 && nFrames<minFrames)
                minFrames=nFrames;
            end
           
            
            disp(sprintf('N of rames:%d\n',nFrames))

        end
    end
end

disp(sprintf('The min frame qtd is: %d',minFrames))

