function showDepthImage(B,idFrame,filename)
    B=mat2gray(B);
    imshow(B);colormap('hot')
    pause(1/60);
end


