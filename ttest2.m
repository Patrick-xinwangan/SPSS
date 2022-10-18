%%两个平均值的比较
%样本标准差相等时，用ttest2进行两个样本的均值比较
function yout=ttest2(x,y,varargin)
alpha=0.05;tail=0;yout=0;
if nargin<2
    error('至少应有两组输入参数')
end
x=x(:);y=y(:);
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
n1=length(x);n2=length(y);
TT=(mean(x)-mean(y))/sqrt(var(x)/n1+var(y)/n2);
xn1=var(x)/n1;
yn2=var(y)/n2;
df=floor((xn1+yn2)^2/(xn1^2/(n1+1)+yn2^2/n2))-2;
switch tail
    case -1
        sui=tinv(1-alpha,df);
        yout=(abs(TT)>=sui)||(TT>=0);
    case 1
        sui=tinv(1-alpha,df);
        yout=(abs(TT)>=sui)||(TT<=0);
    otherwise
        sui=tinv(1-alpha/2,df);
        yout=(abs(TT)>=sui);
end

% x=[78.1 72.4 76.2 74.3 77.4 78.4 76.0 75.5 76.7 77.3];
% y=[79.1 81.0 77.3 79.1 80.0 79.1 79.1 77.3 80.2 82.1];
% yout=ttest2(x,y,0.05,-1)%拒绝原假设，新的操作方法较原来较优