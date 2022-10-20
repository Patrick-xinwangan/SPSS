%%茎叶图
function jyt(x,mtp)
if nargin<2
    mtp=1;
end
a=x(:)*mtp;
a(isnan(a))=[];
b=a-mod(a,10);
b=unique(b);
b=sort(b);
N=length(b);
for k=1:N
    tmp=b(k);
    TT=sort(a');
    TT(TT<tmp)=[];
    TT(TT>tmp+10)=[];
    ts=mat2str(mod(TT,10));
    ts(ts=='[')=[];
    ts(ts==']')=[];
    disp([int2str(tmp/mtp),' : ',ts]);
end
