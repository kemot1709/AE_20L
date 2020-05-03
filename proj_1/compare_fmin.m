clear;
close all;
params;

for i = 1:length(x_start)
    % Quasi-Newton normal
    [~,~,exitflag,output,~,~] = fminunc_quasi_base([x_start(i), y_start(i)],fun_base);
    if exitflag ~= 1
        fprintf('Punkt startowy %i, algorytm quasi-newton normal.%s\n\n',i,output.message);
    end
    fout(i).f_quasi_base = history;
    plot_optimalization(history);
    if flag_save
        saveas(gcf,sprintf('wykres/Quasi_base_%i_fval.png',i));close;
        saveas(gcf,sprintf('wykres/Quasi_base_%i_xy.png',i));close;
    end
        
    % Quasi-Newton with gradient
    [~,~,exitflag,output,~,~] = fminunc_quasi_grad([x_start(i), y_start(i)],fun_grad);
    if exitflag ~= 1
        fprintf('Punkt startowy %i, algorytm quasi-newton gradient.%s\n\n',i,output.message);
    end
    fout(i).f_quasi_grad = history;
    plot_optimalization(history);
    if flag_save
        saveas(gcf,sprintf('wykres/Quasi_grad_%i_fval.png',i));close;
        saveas(gcf,sprintf('wykres/Quasi_grad_%i_xy.png',i));close;
    end
    
     
    % Trust-region with gradient
    [~,~,exitflag,output,~,~] = fminunc_trust_grad([x_start(i), y_start(i)],fun_grad);
    if exitflag ~= 1
        fprintf('Punkt startowy %i, algorytm trust-region gradient.%s\n\n',i,output.message);
    end
    fout(i).f_trust_grad = history;
    plot_optimalization(history);
    if flag_save
        saveas(gcf,sprintf('wykres/Trust_grad_%i_fval.png',i));close;
        saveas(gcf,sprintf('wykres/Trust_grad_%i_xy.png',i));close;
    end

%     % Z jaiegoœ powodu dzia³a tak samo jak z gradientem, dzia³a nawet jak
%     % dostanie macierz bez hesjanu, coœ jest nie tak
%     % Trust-region with hessian
%     [~,~,exitflag,output,~,~] = fminunc_trust_hess([x_start(i), y_start(i)],fun_hess);
%     if exitflag ~= 1
%         fprintf('Punkt startowy %i, algorytm trust-region hessian.%s\n\n',i,output.message);
%     end
%     fout(i).f_trust_hess = history;
%     plot_optimalization(history);
%     if flag_save
%         saveas(gcf,sprintf('wykres/Trust_hess_%i_fval.png',i));close;
%         saveas(gcf,sprintf('wykres/Trust_hess_%i_xy.png',i));close;
%     end

    % Search minimum
    [~,~,exitflag,output] = fminsearch_base([x_start(i), y_start(i)],fun_base);
    if exitflag ~= 1
        fprintf('Punkt startowy %i, algorytm fminsearch.%s\n\n',i,output.message);
    end
    fout(i).f_min_search = history;
    plot_optimalization(history);
    if flag_save
        saveas(gcf,sprintf('wykres/Min_%i_fval.png',i));close;
        saveas(gcf,sprintf('wykres/Min_%i_xy.png',i));close;
    end
end