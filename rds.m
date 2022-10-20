%%异常数据的剔除
function [y,yd]=rds(x,mk,alpha)
x=x(:);
y=x;yd=[];
if nargin<2
    mk='p';
end
if nargin<3
   alpha=0.01;
end
done=1;
while done
    done=0;
    [y,ydtm]=jisuan(x,mk,alpha);
    if length(ydtm)>0
        yd=[yd;ydtm];
        x=y;
        done=1;
    end
end
function y=pauta(n,alpha)
n=min(n,29);
k=1+isequal(alpha,0.05);
G =[0,0;0,0;1.1500,1.1500;1.4900,1.4600;1.7500,1.6700;
1.9400,1.8200;2.1000,1.9400;2.2200,2.0300;2.3200,2.1100;
2.4100,2.1800;2.4800,2.2400;2.5500,2.2900;2.6100,2.3300;
2.6600,2.3700;2.7000,2.4100;2.7400,2.4400;2.7800,2.4700;
2.8200,2.5000;2.8500,2.5300;2.8800,2.5600;2.9100,2.5800;
2.9400,2.6000;2.9600,2.6200;2.9900,2.6400;3.0100,2.6600;
3.1000,2.7400;3.1800,2.8100;3.2400,2.8700;3.3400,2.9600]; 
y=G(n,k);
function[y ,yd]= jisuan(x,mk,alpha)
y=x; yd =[];
n=length(y);
 switch mk 
     case{'p','P'}
         jie=3*std(y);
     case{'g','G'}
         jie=pauta(n,alpha)*std(y);
     case{'t','T'}
         jie=tinv(1-alpha,n-1)*sqrt(n/(n-1))*std(y);
 end
 ind1= find(abs ( y - mean ( y ))> jie );
 [tem,ind]=max(abs(y-mean( y )));
 if ismember ( ind ,ind1)
 yd = y ( ind );
 y ( ind )=[];
 end 
 
 
 
%  x=[20.42;20.43;20.40;20.43;
% 20.42;20.43;20.39;20.30;20.40;
% 20.43;20.42;20.41;20.39;20.39;20.40];
% [y,yd1]=rds(x);yd1

%  [y,yd2]=rds(x,'G',0.05);yd2

%  x=[28.39 28.43 28.43
% 28.39 28.40 28.40
% 28.40 28.30 28.43
% 28.41 28.39 28.42
% 28.42 28.42 28.43]
% [y,yd]=rds(x,'T',0.05);yd
