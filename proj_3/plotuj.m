function [fig, memory] = plotuj(x, y, w, b, n, memory, titel)
    
    fig = figure();
    hold on;
    grid on;
    xlim([-3 3])
    ylim([-3 3])
    xlabel("x1")
    ylabel("x2")
    title(titel)
    
    for i = 1:n
        if y(i)>0
            scatter(x(i,1),x(i,2),'ob','HandleVisibility','off')
        else
            scatter(x(i,1),x(i,2),'xr','HandleVisibility','off')
        end
    end
    
    pom = -5:0.1:5;
    for i = 1:length(memory)
        pom2 = memory(i).pom;
        plot(pom', pom2','Color',kolor(i),'DisplayName',sprintf("w = [%.4f, %.4f], b = %.4f",memory(i).w(1,1),memory(i).w(1,2),memory(i).b));
    end
    
    for i = 1:length(pom)
        pom2(i) = (b-(pom(i)*w(1,1)))/w(1,2);
    end
    len = length(memory);
    memory(len+1).pom = pom2;
    memory(len+1).w = w;
    memory(len+1).b = b;
    plot(pom', pom2','Color',kolor(len+1),'DisplayName',sprintf("w = [%.4f, %.4f], b = %.4f",w(1,1),w(1,2),b));    
    legend('show','Location', 'southoutside');
end