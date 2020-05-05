X=[ 0 0 1;
    0 1 1;
    1 0 1;
    1 1 1;
    ];
D=[ 0
    0
    1
    1
];

W = 2*rand(1,3) - 1;
WB = W;
for i = 1:10000
    W = [W; DeltaSGD(W(end,:), X, D)];
    WB = [WB; DeltaBatch(WB(end,:), X, D)];
end

% N = size(X,1);
% for k = 1:N
%     x = X(k, :)';
%     v = W(end,:)*x;
%     y = sigmf(v,[1 0]);
%     fprintf ('%g\n',y);
% end

close all;
hold on;
plot(W(:,1),'-','Color',kolor(1));
plot(W(:,2),'-','Color',kolor(2));
plot(W(:,3),'-','Color',kolor(3));

plot(WB(:,1),'--','Color',kolor(1));
plot(WB(:,2),'--','Color',kolor(2));
plot(WB(:,3),'--','Color',kolor(3));
hold off;
grid on;
xlabel('Iteration');
ylabel('Value');
axis([0 10000 -10 10])
xticks([0 2000 4000 6000 8000 10000]);
yticks([-10 -5 0 5 10]);

legend('w_{11} SGD','w_{12} SGD','w_{13} SGD','w_{11} Batch','w_{12} Batch','w_{13} Batch');
