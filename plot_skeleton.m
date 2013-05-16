function plot_skeleton(S,n_frame,filename)

J=[20     1     2     1     8    10     2     9    11     3     4     7     7     5     6    14    15    16    17;
    3     3     3     8    10    12     9    11    13     4     7     5     6    14    15    16    17    18    19];
 xlim = [0 800];
 ylim = [0 800];
 zlim = [0 800];
 set(gca, 'xlim', xlim, ...
          'ylim', ylim, ...
          'zlim', zlim);

 h=plot3(S(:,1),S(:,2),S(:,3),'r.');
 %rotate(h,[0 45], -180);
 set(gca,'DataAspectRatio',[1 1 1])
 axis([0 400 0 400 0 400])

 for j=1:19
     c1=J(1,j);
     c2=J(2,j);
     line([S(c1,1) S(c2,1)], [S(c1,2) S(c2,2)], [S(c1,3) S(c2,3)]);
 end
 pause(1/20)