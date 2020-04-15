for i = 1:1:10
    for j=1:1:1
        clearvars -except i j
        
%         start = [i,j];
        min = -6;
        max = 6;
        start = [(max-min)*rand() + min,(max-min)*rand() + min];

        [x,fval,exitflag,output,grad,hessian] = OptimusPrime(start);

        k=0;
        pom = eval(sprintf('state%d',k));
        while pom ~= 'done' %#ok<BDSCA>
            k=k+1;
            pom = eval(sprintf('state%d',k));
        end

        iterations = k;
        funcount = eval(sprintf('optimValues%d.funccount',iterations));
%         okazalo sie, ze nie ma na to miejsca na wykresie, a nie mam czasu kombinowac
%         value = eval(sprintf('optimValues%d.fval',iterations));

        gradient = zeros(iterations+1,2);
        point = zeros(iterations+1,2);
        for k = 0:1:iterations
            point(k+1,:) = eval(sprintf('x%d',k));
            gradient(k+1,:) = eval(sprintf('optimValues%d.gradient',k));
        end
        stop = point(k,:);

        fig = figure;
        
        subplot(1,2,1);
        plot(point(:,1),point(:,2),'.');
        axis([-6 6 -6 6]);
        xticks(-6:1:6);
        yticks(-6:1:6);
        xlabel('x');
        ylabel('y');
        grid on;
        title('Poszukiwane minimum');

        subplot(1,2,2);
        plot(gradient(:,1),gradient(:,2),'-o');
        xlabel('\nablax');
        ylabel('\nablay');
        title('Gradient funkcji w  poszczególnych iteracjach');

        sgtitle(sprintf('Punkt pocz¹tkowy: x=%f, y=%f\nZnalezione optimum lokalne: x=%f, y=%f\nIloœæ iteracji: %d\nIloœæ obliczeñ funkcji celu: %d',start(1),start(2),stop(1),stop(2),iterations,funcount));
%         saveas(gcf,sprintf('wykres/Fminunc_%d_%d.png',i,j));
    end
end

% fsurf(@(x,y) (x^2+y-11)^2+(x+y^2-7)^2)
% saveas(gcf,'wykres/F_all.png');

close all;