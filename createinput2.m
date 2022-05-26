% DRBEM u=sin 2x * e^y dengan syarat batas
% y=0 ======> u=sin 2x
% x=pi/2 ======> un=-2e^y
% y=1 ======> un=e * sin 2x
% x=0 ======> u=0


clear;clc;
N=input('Masukkan banyaknya segmen (Kelipatan 4)=');
n=N/4;
xb=zeros(1,N+1);  % nilai absis pangkal segmen (x(k))
yb=zeros(1,N+1);  % nilai ordinat pangkal segmen (y(k))
bt=zeros(1,N+1);  % boundary type, jika derivatif normal(du/dn) diketahui, maka bt=1. Jika tidak, maka bt=0
bv1=zeros(1,N+1); % nilai u pada batas, jika diket. Jika tidak, maka nilainya 0.
bv2=zeros(1,N+1); % nilai du/dn pada batas, jika diket. Jika tidak, maka nilainya 0.


% berrlawanan arah jarum jam dimulai dari (0,0)
% segmen 1
for i=1:n
    xb(i)=pi/2*(i-1)/n;
    yb(i)=0;
    bt(i)=0;
    bv1(i)=sin(2*(xb(i)+1/(2*n)));
    bv2(i)=0;
end
% segmen 2
for i=n+1:2*n
    xb(i)=pi/2;
    yb(i)=(i-n-1)/n;
    bt(i)=1;
    bv1(i)=0;
    bv2(i)=-2*exp(yb(i)+1/(2*n));
end
% segmen 3
for i=2*n+1:3*n
    xb(i)=(pi/2)-(i-2*n-1)/n;
    yb(i)=1;
    bt(i)=1;
    bv1(i)=0;
    bv2(i)=exp(1)*sin(2*(xb(i)-1/(2*n)));
end
% segmen 4
for i=3*n+1:4*n
    xb(i)=0;
    yb(i)=1-(i-3*n-1)/n;
    bt(i)=0;
    bv1(i)=0;
    bv2(i)=0;
end
xb(N+1)=xb(1);
yb(N+1)=yb(1);
bt(N+1)=bt(1);
bv1(N+1)=bv1(1);
bv2(N+1)=bv2(1);
u=[xb;yb;bt;bv1;bv2];
fid=fopen('input2.txt','wt');
fprintf(fid,'%8.6f  %8.6f   %8.6f   %8.6f   %8.6f \n',u);
fclose(fid);