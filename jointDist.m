function jointDist(S,n_frame,file_name)

    [m,n]=size(S);
    jointDist=zeros(m,n);
    for i=1:m-1
        for j=i+1:m
            p1=S(i,:)
            p2=S(j,:)
            dist=sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2+(p1(3)-p2(3))^2)
            jointDist(i,j)=dist
        end
    end
    
    fp=fopen(strcat(file_name,'_jointDist.txt'),'a');
    [m,n] = size(jointDist)
    fprintf(fp,'%d %d\n',m,n);

    for i=1:m
        for j=1:n
            fprintf(fp,'%f ',jointDist(i,j)); 
        end
        fprintf(fp,'\n');
    end
    
    fclose(fp);

end

