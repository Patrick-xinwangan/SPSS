%%˫�����޽������õķ��������
function table=anova2s(A)
alpha=[0.05,0.01];
format short g
[pval,B]=anova2(A,1,'off');
table=B;
table(2,:)=B(3,:);%�����������ݵ�λ��
table(3,:)=B(2,:);
table(1,1:7)={'������Դ','ƫ��ƽ����','���ɶ�','����','Fֵ','F��','������'};
table(2:5,1)={'�м�����';'�м�����';'���';'�ܺ�'};
F1=finv(1-alpha,table{2,3},table{4,3});
F2=finv(1-alpha,table{3,3},table{4,3});
table{2,6}=[num2str(F1(1)),';',num2str(F1(2))];
table{3,6}=[num2str(F2(1)),';',num2str(F2(2))];
mrk={'������','����','�߶�����'};
tst=1+(pval<0.05)+(pval<0.01);%��
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