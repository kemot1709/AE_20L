function W = DeltaBatch(W, X, D)

% Init consts
alpha = 0.9;
Nw = length(W);
N = length(D);

% Init vectors
W_temp = zeros(1,Nw);

for k = 1:N
    x = X(k, :)';
    d = D(k);
    v = W*x;
    y = sigmf(v,[1 0]);
    e = d - y;
    delta = y*(1-y)*e;
    dW = alpha*delta*x;
    for i = 1:Nw
    	W_temp(i) = W_temp(i) + dW(i);
    end
end

W = W + W_temp/N;


end