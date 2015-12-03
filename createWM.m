function [ W ] = createWmatrix( G )
% Create the Weight Matrix W (populated by algorithmic parameters)
% input:  G -  nxn Adjacency Matrix (undirected graph -> G' = G)

n = size(G,1);          

degree = zeros(1,n);                % degree array (a.k.a # of neighbors)

for i=1:n
   degree(i) = nnz(G(i,:));         % count the local neighbors
end

W = zeros(n);                       % init W matrix

wr = 0;         % sum of m-h weights of the row (excluding where i = j)

for i=1:n
    for j=1:n
        if G(i,j) == 1 && i~=j
            W(i,j) = 1/(max(degree(i),degree(j))+1);
            wr = wr + W(i,j);
        end
    end
    W(i,i) = 1 - wr; %sum(G(i,:),2);
    wr = 0;
end


end

