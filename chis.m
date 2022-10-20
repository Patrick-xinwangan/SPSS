%%卡方检验
function yout=chis(x,varargin)
sigma=1;tail=0;alpha=0.05;yout=0; 
if nargin >1
    tmp = varargin {1};
    if isnumeric(tmp)&&( tmp >0)
        sigma=tmp;
    end 
 end 
 if nargin >2
     tmp = varargin {2};
     if isnumeric(tmp)&&(tmp>0)&&(tmp<1)
         alpha = tmp ;
     end 
 end 
 if nargin >3
     tmp = varargin (3);
     if isnumeric(tmp)
         tail = tmp ;
     end 
 end
 x =x(:);
 n=length (x);
 TT =( n-1)* var(x)/sigma;
switch tail
     case -1
         sui =chi2inv(alpha,n-1);
         yout =(TT<= sui );
    case 1
        sui=chi2inv(1-alpha,n-1);
        you=(TT>= sui );
    otherwise
        si=chi2inv( alpha/2, n-1);
        lian=chi2inv(1-alpha/2,n-1);
        yout=( TT<si)|(TT>lian);
end
 

%  x=[0.142 0.156 0.161 0.145 0.176 0.159 0.165];
%  y1=chis(x,0.15*0.15,0,0.05)
% y2=chis(x,0.15*0.15,-1,0.05)
