function hoj3d(S,n_frame,file_name)

center_hip=S(7,:);
right_hip=S(6,:);
left_hip=S(5,:);

alpha_direction=right_hip-left_hip
alpha_direction(1,3)=0;
theta_direction=[0,0,S(19,3)];

alpha_direction=alpha_direction/norm(alpha_direction);
theta_direction=theta_direction/norm(theta_direction);

n_direction=cross(alpha_direction,theta_direction);

transform_mat(:,1)=alpha_direction;
transform_mat(:,2)=theta_direction;
transform_mat(:,3)=n_direction;

trans_S=zeros(20,3);

intervalos=[0,15;15,45;45,75;75,1050;105,135;135,165;165,180];

hist=zeros(7,12);

for i=1:20
    aux=S(i,:);
    aux=aux-center_hip;
    trans_S(i,:)=aux*transform_mat;
    
    x=trans_S(i,1);
    y=trans_S(i,2);
    z=trans_S(i,3);
    
    trans_S(i,1)=(trans_S(i,1)^2+trans_S(i,2)^2+trans_S(i,3)^2)^1/2;
    trans_S(i,2)=radtodeg(atan(z/trans_S(i,1)));
    trans_S(i,3)=radtodeg(atan(y/x));
    
    if(trans_S(i,3)<0)
      trans_S(i,3)=trans_S(i,3)+360;  
    end
    if(trans_S(i,2)<0)
      trans_S(i,2)=-1*trans_S(i,2);  
    end
    
    
    
    k=0;    
    for j=1:7
        if(trans_S(i,2)>=intervalos(j,1)&&trans_S(i,2)<=intervalos(j,2))
            k=j;
            break;
        end    
    end
    
    
    
    aux=trans_S(i,3)/30
    l=ceil(aux);
    k=ceil(k);
    if(or(isnan(l),isnan(k)))
        continue
    end
    if(k==0)
        k=1;
    end;
    if(l==0)
        l=1;
    end
    
    hist(k,l)=hist(k,l)+1;
    
end

fp=fopen(strcat(file_name,'_hoj3d.txt'),'a');
[m,n] = size(hist)
fprintf(fp,'%d %d\n',m,n);

for i=1:m
    for j=1:n
       fprintf(fp,'%d ',hist(i,j)); 
    end
    fprintf(fp,'\n');
    
end
fclose(fp);


    


