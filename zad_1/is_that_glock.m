function [x,fval,exitflag,output,grad,hessian] = is_that_glock(x0)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fminunc');
%% Modify options setting
options = optimoptions(options,'Display', 'iter-detailed');
options = optimoptions(options,'PlotFcn', {  @optimplotx @optimplotfunccount @optimplotfval @optimplotstepsize @optimplotfirstorderopt });
options = optimoptions(options,'Algorithm', 'quasi-newton');
options = optimoptions(options,'Diagnostics', 'on');
options = optimoptions(options,'OutputFcn', { @outfun });
options = optimoptions(options,'SpecifyObjectiveGradient', false);
options = optimoptions(options,'Hessian', 'off');
options = optimoptions(options,'Display', 'iter');
[x,fval,exitflag,output,grad,hessian] = ...
fminunc(@(x)(x(1)^2+x(2)-11)^2+(x(1)+x(2)^2-7)^2,x0,options);
