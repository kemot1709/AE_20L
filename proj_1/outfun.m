function stop = outfun(x,optimValues,state)
stop = false;
   switch state
       case 'init'
           history.iter = [];
           history.funccount = [];
           history.fval = [];
           history.x = [];
           history.grad = [];
           history.hessian = [];
           assignin('base', 'history', history);
       case 'iter'
           history = evalin('base', 'history');
           
           history.iter = [history.iter; optimValues.iteration];
           history.funccount = [history.funccount; optimValues.funccount];
           history.fval = [history.fval; optimValues.fval];
           history.x = [history.x; x];
           if(isfield(optimValues,'gradient'))
                history.grad = [history.grad; optimValues.gradient'];
           end
           if(isfield(optimValues,'hessian'))
                history.hessian = [history.hessian; optimValues.hessian];
           end
           
           assignin('base', 'history', history);
       case 'done'
       otherwise
   end
end