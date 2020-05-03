function [x,fval,exitflag,output] = fminsearch_base(x0,fun)

% Option settings
options = optimset;
options = optimset(options,'Display', 'off');

% Output and help plots
options = optimset(options,'OutputFcn', { @outfun });

% Launch fminunc
[x,fval,exitflag,output] = fminsearch(fun,x0,options);
