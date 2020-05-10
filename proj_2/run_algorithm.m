clearvars -except fmin fmax favg fvar best
% close all;
params;

sum.min=[0];
sum.max=[0];
sum.avg=[0];
sum.var=[0];

if ~exist('best')
    best.val=0;
end

for i = 1:n
    [X,FVAL,EXITFLAG,OUTPUT,~,~] = ga(@(x) fun(items,x,W), N,[],[],[],[],[],[],[], [],options);

    % GA warnings
    if EXITFLAG ~= 1
        disp('GA Warning');
        disp(OUTPUT.message);
    end

    len = max(length(sum.min),length(history.min));
    sum.min=[sum.min; ones(len-length(sum.min),1)*sum.min(end)];
    sum.max=[sum.max; ones(len-length(sum.max),1)*sum.max(end)];
    sum.avg=[sum.avg; ones(len-length(sum.avg),1)*sum.avg(end)];
    sum.var=[sum.var; ones(len-length(sum.var),1)*sum.var(end)];
    history.min=[history.min; ones(len-length(history.min),1)*history.min(end)];
    history.max=[history.max; ones(len-length(history.max),1)*history.max(end)];
    history.avg=[history.avg; ones(len-length(history.avg),1)*history.avg(end)];
    history.var=[history.var; ones(len-length(history.var),1)*history.var(end)];

    sum.min=sum.min+history.min;
    sum.max=sum.max+history.max;
    sum.avg=sum.avg+history.avg;
    sum.var=sum.var+history.var;
    
    if FVAL<best.val
        best.val=FVAL;
        best.X = X';
    end
end

sum.min=sum.min/n;
sum.max=sum.max/n;
sum.avg=sum.avg/n;
sum.var=sum.var/n;

if ~exist('fmin')
    fmin = figure;
    xlabel('Generation');
    ylabel('Fittness');
    title('Worst value of function');
    
    fmax = figure;
    xlabel('Generation');
    ylabel('Fittness');
    title('Best value of function');
    
    favg = figure;
    xlabel('Generation');
    ylabel('Fittness');
    title('Average value of function');
    
    fvar = figure;
    xlabel('Generation');
    ylabel('Variance');
    title('Variance of function');
end

% TODO zrobiæ tak, abym nie musia³ zmieniaæ kolorków rêcznie
fmin = add_to_plot(fmin,kolor(Sel_nr),-sum.min,chooser);
fmax = add_to_plot(fmax,kolor(Sel_nr),-sum.max,chooser);
favg = add_to_plot(favg,kolor(Sel_nr),-sum.avg,chooser);
fvar = add_to_plot(fvar,kolor(Sel_nr),sum.var,chooser);


function out = fun(items,x,W)
    out = -1*sum(items(:,2).*x');
    if sum(items(:,1).*x')-W>0
        out=0;
    end
end
