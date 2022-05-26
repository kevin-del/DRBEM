clear;clc;
L=input('Masukkan jumlah titik interior (bilangan kuadratik)=');
s=sqrt(L);
x=zeros(1,L);
y=zeros(1,L);
for i=1:s
    for j=1:s
        x((i-1)*s+j)=j/(s+1);
        y((i-1)*s+j)=i/(s+1);
    end
end
u=[x;y];
fid=fopen('interior.txt','wt');
fprintf(fid,'%8.6f  %8.6f \n',u);
fclose(fid);