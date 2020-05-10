% Wpisz numer albumu
numerAlbumu=293457;
rng(numerAlbumu);

N=32; 
% N=64;
items(:,1)=round(0.1+0.9*rand(N,1),1);
items(:,2)=round(1+99*rand(N,1));

% BARDZO WA¯NE !!!
rng('shuffle');

W = sum(items(:,1))*0.3;

% Options of GA
options = optimoptions('ga');
options = optimoptions(options, 'PopulationSize', 100);
options = optimoptions(options, 'Generations', 200);
options = optimoptions(options, 'OutputFcn', { @outfun });
options = optimoptions(options, 'Display', 'off');
options = optimoptions(options, 'CrossoverFraction', 1);
options = optimoptions(options, 'TolFun', 1e-6);
options = optimoptions(options, 'EliteCount', 1);
options = optimoptions(options, 'PopulationType', 'bitstring');

Sel_nr = 1;%1,3,4,5
options = optimoptions(options, 'SelectionFcn', get_SelectionFcn(Sel_nr));

Cross_nr = 1;%1,4,5
options = optimoptions(options, 'CrossoverFcn', get_CrossoverFcn(Cross_nr));

Mut_nr = 1;%1,2,3
options = optimoptions(options, 'MutationFcn', get_MutationFcn(Mut_nr));

chooser = get_SelectionFcn(Sel_nr);
% chooser = get_CrossoverFcn(Cross_nr);
% chooser = get_MutationFcn(Mut_nr);

% Average params
n = 25;


function out = get_SelectionFcn(n)
% {'selectionstochunif'} for ga, {'selectiontournament'} for gamultiobj | 'selectionremainder' | 'selectionuniform' | 'selectionroulette'

    switch (n)
        case 1
            out = 'selectionstochunif';
        case 2
            out = 'selectiontournament';
        case 3
            out = 'selectionremainder';
        case 4
            out = 'selectionuniform';
        case 5
            out = 'selectionroulette';
        otherwise
            out = 'selectionstochunif';
    end
end

function out = get_CrossoverFcn(n)
% {'crossoverscattered'} for ga, {'crossoverintermediate'}* for gamultiobj | 'crossoverheuristic' | 'crossoversinglepoint' | 'crossovertwopoint' | 'crossoverarithmetic'

    switch (n)
        case 1
            out = 'crossoverscattered';
        case 2
            out = 'crossoverintermediate';
        case 3
            out = 'crossoverheuristic';
        case 4
            out = 'crossoversinglepoint';
        case 5
            out = 'crossovertwopoint';
        case 6
            out = 'crossoverarithmetic';
        otherwise
            out = 'crossoverscattered';
    end
end

function out = get_MutationFcn(n)
% {'mutationgaussian'} for ga, {'mutationadaptfeasible'}* for gamultiobj | 'mutationuniform'

    switch (n)
        case 1
            out = 'mutationgaussian';
        case 2
            out = 'mutationadaptfeasible';
        case 3
            out = 'mutationuniform';
        otherwise
            out = 'mutationgaussian';
    end
end