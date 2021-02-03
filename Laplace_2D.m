%{
Author: Maharshi Gurjar
ELEC 4700 - PA 3 
%}
nx=50;
ny=50;
numLoops=200;
V= zeros(nx,ny);
Boundary_Ones=ones(ny,1);
Boundary_Zeros=zeros(ny,1);
V(:,1)=Boundary_Ones;
V(:,ny)=Boundary_Zeros;
figure(1)
h = surf(V);
for i=1:numLoops
   V = imboxfilt(V,3);%2-D box filtering of images
   V(:,1)=Boundary_Ones;
   V(:,ny)=Boundary_Ones;
   V(1,:) = Boundary_Zeros;
   V(nx,:) = Boundary_Zeros;
   h = surf(V);
   pause(0.01);
end
[Ex,Ey] = gradient(V);
figure(2)
Esurfplot = subplot(2,1,1);
Esurf = surf(Ex,Ey);
Equivplot = subplot(2,1,2);
Equiv = quiver(Ex,Ey);
