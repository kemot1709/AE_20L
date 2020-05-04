% Wpisz numer albumu
numerAlbumu=293457;
rng(numerAlbumu);

N=32; 
% N=64;
items(:,1)=round(0.1+0.9*rand(N,1),1);
items(:,2)=round(1+99*rand(N,1));

W = sum(items(:,1))*0.3;

options = optimoptions('ga', 'Display', 'off');