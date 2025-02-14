function [toFrames]=sreadSkeletonDataset(file, callback, nFrames, filename)

if nargin < 3
    nFrames=0;
end
if nargin < 4
    filename='';
end

fp=fopen(file);
B=[]
if (fp>0)
    A=fscanf(fp,'%f');
    B=[B; A];
    fclose(fp);
end


l=size(B,1)/4;
B=reshape(B,4,l);
B=B';
B=reshape(B,20,l/20,4);

X=B(:,:,1);
Z=400-B(:,:,2);
Y=B(:,:,3)/4;
P=B(:,:,4);


if(nFrames<1)
    toFrames=size(X,2);
else
    toFrames=nFrames;
end

for s=1:toFrames
    S=[X(:,s) Y(:,s) Z(:,s)];
  
    callback(S,s,filename)
    
end

