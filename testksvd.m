%% Test cloudksvd
clear, clc

%% General specifications (site number, sparsity, iteration number, graph topology and W matrix)
N = 10;             % # of sites to collaborate
To = 5;             % sparsity constraint
Td = 10;             % # of iterations

G = createConnG(10);
W = createWM(G);

%% Signal specifications
m = 20;              % dimension of each signal
n = 50;              % # of signals per site

Y = rand(m,n,N);

%% Dictionary specifications
K = 100;             % # of atoms in each dictionary
D = zeros(m,K,N);

for i=1:N
    D(:,:,i) = createDictionary(m,K);
end

%% Run cloudksvd


[D,X] = cloudksvd(Y,D,To,Td,W);

Y(:,:,1) - D(:,:,1)*X(:,:,1)