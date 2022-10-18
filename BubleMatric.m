%%¾ØÕóÆøÅÝÍ¼¡ª¡ªÉ¢µãÍ¼½ø½×
function [hfig, axes1] = BubleMatric(Xlabel, Ylabel, Zsize, PointSize)
Zsize1 = Zsize;
Zsize1(Zsize==0) = 1E-9;
hfig =  figure;
axes1 = axes('Parent',hfig); 
set(axes1, 'YTick', 1:length(Ylabel), 'YTickLabel', Ylabel);
set(axes1, 'XTick', 1:length(Xlabel), 'XTickLabel', Xlabel);
col = length(Xlabel);
row = length(Ylabel);
hold on
axis([0 col+1 0 row+1])
for i = 1: row
    scatter(1:col, ones(1,col)*i, Zsize1(i,:)*PointSize, 'filled');
    for j = 1: col
        if Zsize(i,j)>=1
            text(j, i, num2str(Zsize(i,j),'%g'), ...
                'HorizontalAlignment','center');
        end
    end
end
grid on
end

%BubleMatric(['A' 'B' 'C' 'D'], ['1' '2' '3' '4'], [7 5 1 3; 2 9 7 7; 3 4 9 2; 0 7 8 5], 250)