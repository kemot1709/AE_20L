function [x,fval,exitflag,output,grad,hessian] = work_hmm(x0,fun)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fminunc');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'Algorithm', 'quasi-newton');
options = optimoptions(options,'SpecifyObjectiveGradient', true);
options = optimoptions(options,'Hessian', 'off');
[x,fval,exitflag,output,grad,hessian] = ...
fminunc(fun,x0,options);
