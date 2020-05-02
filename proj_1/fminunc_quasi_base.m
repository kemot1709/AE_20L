function [x,fval,exitflag,output,grad,hessian] = fminunc_quasi_base(x0,fun)

% Option settings
options = optimoptions('fminunc');
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'Diagnostics', 'off');

% Output and help plots
% options = optimoptions(options,'PlotFcn', {  @optimplotx @optimplotfunccount @optimplotfval @optimplotstepsize @optimplotfirstorderopt });
options = optimoptions(options,'OutputFcn', { @outfun });

% Specification of algorithm
options = optimoptions(options,'Algorithm', 'quasi-newton');

% Launch fminunc
[x,fval,exitflag,output,grad,hessian] = fminunc(fun,x0,options);
