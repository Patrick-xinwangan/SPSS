%%盒形图
function xxt(x)
x=x(:);
boxplot(x,0,'x');
xlabel('');
ylabel('数据值');
title('盒形图');
