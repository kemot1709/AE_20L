clear;
close all;
params;

for i = 1:length(x_start)
    [x,fval,exitflag,output,grad,hessian] = work_hmm([x_start(i), y_start(i)],fun_grad)
    
    
end