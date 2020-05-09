function [state,options,optchanged] = outfun(options,state,flag)
% Outfun for GA
% Called every iteration
optchanged = false;
    switch flag
       case 'init'
           history.avg = [];
           history.min = [];
           history.max = [];
           history.var = [];
           assignin('base', 'history', history);
       case 'iter'
           history = evalin('base', 'history');
           
           history.avg = [history.avg; mean(state.Score)];
           history.min = [history.min; max(state.Score)];
           history.max = [history.max; min(state.Score)];
           history.var = [history.var; var(state.Score)];
           
           assignin('base', 'history', history);
       case 'done'
       otherwise
   end
end
