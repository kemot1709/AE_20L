function [x,fval,exitflag,output,grad,hessian] = fminunc_quasi_hess(x0)

% Option settings
options = optimoptions('fminunc');
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'Diagnostics', 'off');
% options = optimoptions(options,'MaxFunctionEvaluations', MaxFunctionEvaluations_Data);
% options = optimoptions(options,'MaxIterations', MaxIterations_Data);
% options = optimoptions(options,'OutputFcn', { @out_every_iteration });
% options = optimoptions(options,'PlotFcn', {  @optimplotx @optimplotfunccount @optimplotfval @optimplotstepsize @optimplotfirstorderopt });

options = optimoptions(options,'Algorithm', 'quasi-newton');
options = optimoptions(options,'SpecifyObjectiveGradient', true);

[x,fval,exitflag,output,grad,hessian] = ...
fminunc({  @(x)(1-x(1)+a)^2+100*(x(2)-b-(x(1)-a)^2)^2 @(x)[2*(-1-a+x(1)-200*(a-x(1))*(a^2+b-2*a*x(1)+x(1)^2-x(2))),200*(-b-(a-x(1))^2+x(2))] },x0,options);
