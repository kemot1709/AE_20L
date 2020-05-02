clear;
close all;
params;

for i = 1:length(x_start)
    % Quasi-Newton with gradient
    [x,fval,exitflag,output,~,~] = fminunc_quasi_grad([x_start(i), y_start(i)],fun_grad);
    if exitflag == 1
        fout(i).f_quasi_grad = history;
        plot_optimalization(history);
    end
%     clearvars history
end