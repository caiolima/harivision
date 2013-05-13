function readDepthDataset(file, callback, nFrames, filename)

if nargin < 3
    nFrames=0;
end

fid=fopen(file);
num_frames=fread(fid,1,'ubit32');
n_cols=fread(fid,1,'ubit32');
n_rows=fread(fid,1,'ubit32');

B = zeros(n_rows,n_cols);
if(nFrames<1)
    toFrames=num_frames;
else
    toFrames=nFrames;
end

for f=1:toFrames
    for i=1:n_rows
        tempRow=fread(fid,n_cols,'ubit32');
        for j=1:n_cols
            B(i,j)=tempRow(j);
        end
    end
    
    callback(B,f, filename);
end
fclose(fid);