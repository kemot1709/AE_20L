clearvars;
close all;
params;

flag_done = 0;
iteration = 0;
while ~flag_done
    flag_done = 1;
    iteration = iteration + 1;
    memory = [];
    [~, memory] = plotuj(x, y, w, b, 0, memory, sprintf('Pocz¹tek iteracji %i',iteration));
    for i = 1:length(y)
        if sign(w*x(i,:)' - b)~=y(i)
            flag_done = 0;
            w = w + theta*y(i)*x(i,:);
            b = b - theta * y(i) * r^2;
            [~, memory] = plotuj(x, y, w, b, i, memory, "Temporary");
        end
    end
    
    error = 0;
    for i = 1:length(y)
        if sign(w*x(i,:)' - b)~=y(i)
            error = error + 1;
        end
    end
    [~, memory] = plotuj(x, y, w, b, i, memory(1:length(memory)-1),sprintf('Iteracja %i, b³¹d klasyfikacji %i',iteration,error));

end

