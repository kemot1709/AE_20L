function fig = add_to_plot(fig, kolor, data, legenda)

    figure(fig);
    hold on;
    plot(data,'Color',kolor);
    pom = legend();
    pom.String(end) = {legenda};
    
    hold off;

end