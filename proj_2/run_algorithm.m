clear;
close all;
params;

lb = zeros(1,N);
ub = ones(1,N);
inty = zeros(1,N);
for i = 1:N
    inty(i)=i;
end

[X,FVAL,EXITFLAG,OUTPUT,POPULATION,SCORES] = ga(@(x) fun(items(:,2),x), N,[],[],[],[],lb,ub,@(x) nonlinfun(items(:,1),x,W), inty,options);


function out = fun(items,x)
    out = -1*sum(items.*x');
end

function [c, ceq] = nonlinfun(items,x,W)
    c = sum(items.*x')-W;
    ceq=[];
end