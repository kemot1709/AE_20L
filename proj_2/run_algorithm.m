% clear;
% close all;
params;

% TODO zrobiæ œredni¹ z uruchomieñ
% for i = 1:n
    [X,~,EXITFLAG,OUTPUT,~,~] = ga(@(x) fun(items(:,2),x), N,[],[],[],[],lb,ub,@(x) nonlinfun(items(:,1),x,W), inty,options);

    % GA warnings
    if EXITFLAG ~= 1
        disp('GA Warning');
        disp(OUTPUT.message);
    end
%     disp(X');
% end

if ~exist('fmin')
    fmin = figure;
%     fmax = figure;
%     favg = figure;
%     fvar = figure;
end

fmin = add_to_plot(fmin,kolor(Sel_nr),history.min,options.SelectionFcn);
% fmax = figure;
% favg = figure;
% fvar = figure;


function out = fun(items,x)
    out = -1*sum(items.*x');
end

function [c, ceq] = nonlinfun(items,x,W)
    c = sum(items.*x')-W;
    ceq=[];
end