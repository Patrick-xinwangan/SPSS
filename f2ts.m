%%F检验
function yout=f2ts(x,y,varargin)
tail=0;alpha=0.05;yout=0;
if nargin<2
    error('至少应有两组输入参数')
end
if nargin>2
    tmp=varargin{1};
    if isnumeric(tmp)&&(tmp>0)&&(tmp<1)
        alpha=tmp;
    end
end
if nargin>3
    tmp=varargin{2};
    if isnumeric(tmp)
        tail=tmp;
    end
end
x=x(:);y=y(:);
n1=length(x);n2=length(y);
TT=var(x)/var(y);
switch tail
    case -1
        sui=finv(alpha,n1-1,n2-1);
        yout=(TT>=1)||(TT<=sui);
    case 1
        sui=finv(1-alpha,n1-1,n2-1);
        yout=(TT<=1)||(TT>=sui);
    otherwise
        si=finv(alpha/2,n1-1,n2-1);
        lian=finv(1-alpha/2,n1-1,n2-1);
        yout=(TT<=si)||(TT>=lian);
end




% x=[0.163 0.175 0.159 0.168 0.169 0.161 0.166 0.179 0.174 0.173];
% y=[0.153 0.181 0.165 0.155 0.156 0.161 0.175 0.174 0.164 0.183 0.179];
% yout1=f2ts(x,y,0,0.05)
% yout2=f2ts(x,y,-1,0.05)
% x=[79.98,80.04,80.02,80.04,80.03,80.04,80.03,79.97,80.05,80.03,80.02,80.00,80.02];
% y=[80.02,79.94,79.97,79.98,79.97,80.03,79.95,79.97];
% yout1=f2ts(x,y,0,0.05)