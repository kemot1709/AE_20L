function stop = outfun(x,optimValues,state)
    assignin('base',sprintf('x%d',optimValues.iteration),x);
    assignin('base',sprintf('optimValues%d',optimValues.iteration),optimValues);
    assignin('base',sprintf('state%d',optimValues.iteration),state);
    stop=0;