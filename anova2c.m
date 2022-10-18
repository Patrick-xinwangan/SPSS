%%˫�����н������õķ��������
function table=anova2c(A,reps)
if nargin<2
    error('�����뵥Ԫ������')
end
[m,n]=size(A);
if mod(m,reps)
    error('����A�����������ǵ�Ԫ����reps�ı���')
end
alpha=[0.05,0.01];
format short g
[pval,B]=anova2(A,reps,'off');
table=B;
table(2,:)=B(3,:);
table(3,:)=B(2,:);
table(1,1:7)={'������Դ','ƫ��ƽ����','���ɶ�','����','Fֵ','F��','������'};
table(2:6,1)={'�м�����';'�м�����';'��������';'���';'�ܺ�'};
F1=finv(1-alpha,table{2,3},table{5,3});
F2=finv(1-alpha,table{3,3},table{5,3});
F3=finv(1-alpha,table{4,3},table{5,3});
table{2,6}=[num2str(F1(1)),';',num2str(F1(2))];
table{3,6}=[num2str(F2(1)),';',num2str(F2(2))];
table{4,6}=[num2str(F3(1)),';',num2str(F3(2))];
mrk={'������','����','�߶�����'};
tst=1+(pval<0.05)+(pval<0.01);%��
table(2:4,7)={mrk{tst(2)},mrk{tst(1)},mrk{tst(3)}};

%  A=[85 72 70
% 89 70 67
% 82 91 85
% 84 88 83
% 65 59 60
% 61 62 56
% 67 75 85
% 71 78 89
% ];
% table=anova2c(A,2);



% A=[31 34 35 39
% 33 36 36 38
% 33 36 37 38
% 34 37 39 41
% 35 37 39 42
% 37 38 40 44];
% table=anova2c(A,2)






%%SPSS�κ���ϰ��ʵ�飩
%%���������ݼ����
% A=[8 12 
% 12 8
% 22 26
% 14 30
% 10 18
% 18 14];
% table=anova2c(A,2)

%%���������ݼ����
%  A=[41 38 59 47
% 30 31 48 40
% 45 39 51 39
% 25 29 44 43
% 31 35 48 42
% 22 30 50 53
% 18 22 29 24
% 29 17 28 27
% 33 25 26 32];
% table=anova2c(A,3)


