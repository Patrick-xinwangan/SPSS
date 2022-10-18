%%双因素无交互作用的方差分析表
function table=anova2s(A)
alpha=[0.05,0.01];
format short g
[pval,B]=anova2(A,1,'off');
table=B;
table(2,:)=B(3,:);%交换行列数据的位置
table(3,:)=B(2,:);
table(1,1:7)={'方差来源','偏差平方和','自由度','方差','F值','Fα','显著性'};
table(2:5,1)={'行间因素';'列间因素';'误差';'总和'};
F1=finv(1-alpha,table{2,3},table{4,3});
F2=finv(1-alpha,table{3,3},table{4,3});
table{2,6}=[num2str(F1(1)),';',num2str(F1(2))];
table{3,6}=[num2str(F2(1)),';',num2str(F2(2))];
mrk={'不显著','显著','高度显著'};
tst=1+(pval<0.05)+(pval<0.01);%行
table(2:3,7)={mrk{tst(2)},mrk{tst(1)}};


% A=[3.5 2.3 2.0
% 2.6 2.0 1.9
% 2.0 1.5 1.2
% 1.4 0.8 0.3];
% table=anova2s(A)


%  A=[64 66 68
% 66 68 67
% 65 67 68];
% table=anova2s(A)