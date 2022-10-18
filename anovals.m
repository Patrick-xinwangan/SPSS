%%方差分析表
function table=anovals(A)
alpha1=0.05;
alpha2=0.01;
[pval,table]=anova1(A,[],'off');
table(1,1:7)=cell(1,7);
table(1,:)={'方差来源','偏差平方和','自由度','方差','F值','Fα','显著性'};
table(2:4,1)={'因素A';'误差e';'总和'};
table{2,6}=finv(1-alpha1,table{2,3},table{3,3});
table{3,6}=finv(1-alpha2,table{2,3},table{3,3});
mrk={'不显著','显著','高度显著'};
tst=1+(pval<0.05)+(pval<0.01);
table{2,7}=mrk{tst};