function [x,fval,exitflag,output,grad,hessian] = untitled(x0)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fminunc');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'Algorithm', 'quasi-newton');
[x,fval,exitflag,output,grad,hessian] = ...
fminunc({  @(x)(1-x(1)+a)^2+100*(x(2)-b-(x(1)-a)^2)^2 @(x)[2*(-1-a+x(1)-200*(a-x(1))*(a^2+b-2*a*x(1)+x(1)^2-x(2))),200*(-b-(a-x(1))^2+x(2))] @(x)[-400,(-(x(1)-a)^2-b+x(2))+800,(x(1)-a)^2+2,-400,(x(1)-a);-400,(x(1)-a),200] },x0,options);
