function fig = plot_optimalization(input)
% Funkcja rysujaca wykresy minimalizacji funkcji
    fig(1) = figure;
    
    topic = sprintf('Punkt pocz¹tkowy: x=%f, y=%f\nZnalezione optimum lokalne: x=%f, y=%f\nWartoœæ optimum lokalnego: f(x,y)=%f\nIloœæ iteracji: %d Iloœæ obliczeñ funkcji celu: %d\n',input.x(1,1),input.x(1,2),input.x(end,1),input.x(end,2),input.fval(end),input.iter(end),input.funccount(end));
    if(isfield(input,'grad'))
        subplot(1,2,1);
    end
    a = evalin('base', 'a');
    b = evalin('base', 'b');
    fcontour(@(x,y) (1-x+a)^2 + 100*(y-b-(x-a)^2)^2,'LevelStep',100);
    hold on;
    plot_rainbow(input.x(:,1),input.x(:,2),'.');
    hold off;
        
    % Dobrane pod rozwi¹zywany problem
    axis([-2.5 2.5 -2.5 2.5]);
    xticks(-2.5:0.5:2.5);
    yticks(-2.5:0.5:2.5);
    % 
    
    grid on;
    xlabel('x');
    ylabel('y');
    if(isfield(input,'grad'))
        title('Poszukiwane minimum');

        subplot(1,2,2);
        plot_rainbow_line(input.grad(:,1),input.grad(:,2),'-o');

        xlabel('\nablax');
        ylabel('\nablay');
        title('Gradient funkcji');
        sgtitle(topic);
    else
        title(topic);
    end
    

    fig(2) = figure;
    semilogy(input.iter,input.fval,'d',...
        'Color',kolor(1),'MarkerFaceColor',kolor(1),...
        'MarkerEdgeColor', kolor(2));
    
    grid on;
    xlabel('iteracja');
    ylabel('wartoœæ funkcji celu');
    title('Wartoœæ funkcji celu w kolejnych iteracjach');
end

function plot_rainbow(x,y,options)
flag = ishold;

hold on;
for i=1:length(x)
    plot(x(i),y(i),options,'Color',rainbow(0,length(x),i,kolor(1),kolor(2)));
end

if ~flag
    hold off;
end
end

function plot_rainbow_line(x,y,options)
flag = ishold;

hold on;
for i=1:length(x)-1
    plot(x(i:i+1),y(i:i+1),options,'Color',rainbow(0,length(x),i,kolor(1),kolor(2)));
end
plot(x(length(x)),y(length(x)),options,'Color',kolor(2));

if ~flag
    hold off;
end
end