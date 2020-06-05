clearvars;
close all;
params;

flag_done = 0;
while ~flag_done
    flag_done = 1;
    for i = 1:length(y)
        if sign(w*x(i,:)' - b)~=y(i)
            flag_done = 0;
            w = w + theta*y(i)*x(i,:);
            b = b - theta * y(i) * r^2;
        end
        plotuj(x, y, w, b, i);
    end

end

