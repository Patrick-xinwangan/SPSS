%%经验分布函数图
function scdfplot(X)
X=X(:)';
X=sort(X);
n=length(X);
xsui=ones(size(X));
B=cumsum(xsui);
B=B/n;
xl=min(X)-(max(X)-min(X))*0.1;
xr=max(X)+(max(X)-min(X))*0.1;
x=[xl,X,xr];
y=[0,B,1];
h=stairs(x,y);
set(h,'linewidth',2,'color','k')
xlabel('x')
ylabel('F(x)')
grid on
axis([xl,xr,-0.05,1.05])
title('经验分布函数')