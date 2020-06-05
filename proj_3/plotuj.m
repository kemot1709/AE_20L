function fig = plotuj(x, y, w, b, n)
    
    close;
    fig = figure();
    hold on;
    for i = 1:n
        if y(i)>0
            scatter(x(i,1),x(i,2),'ob')
        else
            scatter(x(i,1),x(i,2),'xr')
        end
    end
    
    pom = -5:0.1:5;
    for i = 1:length(pom)
        pom2(i) = (b-(pom(i)*w(1,1)))/w(1,2);
    end
    plot(pom', pom2');    
end