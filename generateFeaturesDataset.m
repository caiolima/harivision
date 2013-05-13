max_action=3
max_people=10
max_doc=20

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
            
            file = sprintf('a%s_s%s_e0%d_',s_i,s_j,k)
            
            %if exist(sprintf('C:\\Users\\Linder\\Documents\\dataset\\skeletons\\MSRAction3DSkeleton(20joints)\\%sskeleton.txt',file), 'file')
            %     readSkeletonDataset(sprintf('C:\\Users\\Linder\\Documents\\dataset\\skeletons\\MSRAction3DSkeleton(20joints)\\%sskeleton.txt',file),@jointDist,0, strcat('features_dataset/joint_dist/',file))
            %     readSkeletonDataset(sprintf('C:\\Users\\Linder\\Documents\\dataset\\skeletons\\MSRAction3DSkeleton(20joints)\\%sskeleton.txt',file),@hoj3d,0, strcat('features_dataset/hoj3d/',file)); 
            %end
                
            if exist(sprintf('C:\\Users\\Linder\\Documents\\dataset\\kinect dataset\\%ssdepth.bin',file), 'file')
                readDepthDataset(sprintf('C:\\Users\\Linder\\Documents\\dataset\\kinect dataset\\%ssdepth.bin',file),@showRadonTransform,0, strcat('features_dataset/radon/',file));
            end
        end
    end
end