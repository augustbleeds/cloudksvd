function z = isConnected( A )
n = length(A);
C = false(1, n);                % marks nodes in the same component as node 1
N = [ true false(1, n-1) ];     % marks newly found nodes to be added to C
while any(N)
  C = C | N;
  N = sum(A(N,:), 1) & ~C;
end
z = all(C);
end