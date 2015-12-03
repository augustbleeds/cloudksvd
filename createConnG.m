function G = createConnG(n)
%CREATECG Creates a connected Graph in the form of an n x n adjMatrix 
%   n = # of nodes

connected = false;

while(~connected)
    G = zeros(n);

    i = 1;              %loop to create a symmetric matrix
    while(i <= n)
    
        j = 1;
   
        while(j < i)
            G(i,j) = round(rand(1));    % p = .05 that an edge exists
            j = j + 1;
            
        end
    
    i = i + 1;

    end

G = G + G';

connected = isConnected(G);

end

end