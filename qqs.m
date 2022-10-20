%%QQ图
function qqs(y)
y=y(:)';
y=sort(y);
NNS=length(y);
x=norminv(((1:NNS)-0.375)./(NNS+0.25),0,1);
sigma=std(y);mu=mean(y);
xx=[min(x),max(x)];
yy=mu+sigma*xx;
plot(x,y,'.k',xx,yy)
grid on
title('QQͼ')
