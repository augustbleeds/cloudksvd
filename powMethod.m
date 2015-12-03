function Z = powMethod(Z, M, b)
%Z - n local eigenvectors where Z(i,:) corresponds to M(:,:,i)
%M - %stores n , m x m ,  local matrices in a (m x m x n) matrix

n = size(M,3);

for poweriter=1:b    %carry out power method b times
    for i=1:n        %over each eigenvector, perform power method
        col = Z(i,:);
        Z(i,:) = (M(:,:,i)*col')'; 
    end
end
end
