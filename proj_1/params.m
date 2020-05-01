% Data nr 8

% Function params
a = -1;
b = -1;
fun = @(x) (1-x(1)+a)^2 + 100*(x(2)-b-(x(1)-a)^2)^2;
grad = @(x) [2 *(-1 - a + x(1) - 200 *(a - x(1)) *(a^2 + b - 2 *a* x(1) + x(1)^2 - x(2))), 200 *(-b - (a - x(1))^2 + x(2))];
hess = @(x) [-400 (-(x(1) - a)^2 - b + x(2)) + 800 (x(1) - a)^2 + 2 , -400 (x(1) - a);
-400 (x(1) - a) , 200];
clearvars a b

% Agregates for fmin functions
fun_base = fun;

fun_grad {1} = fun;
fun_grad {2} = grad;

fun_hess {1} = fun;
fun_hess {2} = grad;
fun_hess {3} = hess;
clearvars fun grad hess

% Start points
x_start = [1 0 -2 -2];
y_start = [0 -2 -2 0];
