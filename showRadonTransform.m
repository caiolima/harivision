function showRadonTransform(B,idFrame,filename)
 
    iptsetpref('ImshowAxesVisible','on')
    theta = 0:180;
    [R,xp] = radon(B,theta);

    Rt=zeros(1,length(theta))
    for mTheta=1:length(theta)
        result=0
        for mRo=1:length(xp)
            result=result+(R(mRo,mTheta)^2) 
        end
        Rt(mTheta)=result
    end
    
    fp=fopen(strcat(filename,'_radon.txt'),'a');
    [m,n] = size(Rt)
    fprintf(fp,'%d %d\n',m,n);

    for i=1:m
        for j=1:n
            fprintf(fp,'%f ',Rt(i,j)); 
        end
        fprintf(fp,'\n');
    end
    
    fclose(fp);
    
end


