%%计算协方差矩阵和相关矩阵
function Covariance(x)
[n,m]=size(x);
corrx=corr(x);%自相关性
covx=cov(x)%协方差矩阵
corrcoefx=corrcoef(x)%相关系数矩阵
%  for i=1:m
%      for j=1:m
%          fprintf('%f\t',corrx(i,j));
%      end
%      fprintf('\n');
%  end
% x=[43640	23574	46776
% 33188	19285	36067
% 19954	15391	24192
% 17191	11410	21965
% 22658	15691	27194
% 23831	14606	28438
% 19605	13411	24421
% 20636	15225	24422
% 48879	27205	51295
% 31451	21130	36558
% 36668	25415	42193
% 21911	17163	26495
% 28440	19290	33942
% 20290	15663	24587
% 22821	14299	29314
% 18391	14073	23178
% 23846	17647	28506
% 22798	16951	28294
% 31589	20012	36621
% 18088	14165	22555
% 22242	15487	27565
% 24598	16096	29850
% 21518	16444	26971
% 17957	14165	25333
% 18851	12386	27441
% 15342	10577	28159
% 19347	13158	24784
% 17456	11206	25757
% 19020	13300	24513
% 20024	13536	25386
% 18961	12821	25724];