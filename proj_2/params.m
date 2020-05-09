% Wpisz numer albumu
numerAlbumu=293457;
rng(numerAlbumu);

N=32; 
% N=64;
items(:,1)=round(0.1+0.9*rand(N,1),1);
items(:,2)=round(1+99*rand(N,1));

W = sum(items(:,1))*0.3;

% Params of GA
lb = zeros(1,N);
ub = ones(1,N);
inty = zeros(1,N);
for i = 1:N
    inty(i)=i;
end

% Options of GA
options = optimoptions('ga');
options = optimoptions(options, 'PopulationSize', 100);
options = optimoptions(options, 'Generations', 1000);
options = optimoptions(options, 'OutputFcn', { @outfun });
options = optimoptions(options, 'Display', 'off');
options = optimoptions(options, 'CrossoverFraction', 1);
options = optimoptions(options, 'TolFun', 1e-6);
options = optimoptions(options, 'EliteCount', 1);

Sel_nr = 1;
options = optimoptions(options, 'SelectionFcn', get_SelectionFcn(Sel_nr));

% {'crossoverscattered'} for ga, {'crossoverintermediate'}* for gamultiobj | 'crossoverheuristic' | 'crossoversinglepoint' | 'crossovertwopoint' | 'crossoverarithmetic'
options = optimoptions(options, 'CrossoverFcn', 'crossoverscattered');

% I tak nie dzia³a bo mam ograniczenia "integer constraints"
% {'mutationgaussian'} for ga, {'mutationadaptfeasible'}* for gamultiobj | 'mutationuniform'
% options = optimoptions(options, 'MutationFcn', 'mutationuniform');

% Average params
n = 10;


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