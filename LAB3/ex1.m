% Orthogonality concept - for vectors and matrices
clear all; close all;
% Vectors for task1
x1 = [1/sqrt(4), 1/sqrt(4), 1/sqrt(4), 1/sqrt(4)];
x2 = [1/sqrt(4), 1/sqrt(4), -1/sqrt(4), -1/sqrt(4)];
x3 = [1/sqrt(4), -1/sqrt(4), -1/sqrt(4), 1/sqrt(4)];
x4 = [1/sqrt(4), -1/sqrt(4), 1/sqrt(4), -1/sqrt(4)];


% into one matrix
A = [x1;x2;x3;x4];

%check normalization of each vector (1 means normalized):
check = [sum(dot(A(1,:), A(1,:))), sum(dot(A(2,:), A(2,:))), sum(dot(A(3,:), A(3,:))), sum(dot(A(4,:), A(4,:)))];

%check orthogonality
for i = 1:4
    for k = i+1:4
        dotProduct = dot(A(i,:), A(k,:));
        if dotProduct == 0
            disp('orthogonal - ');
            disp(i);
            disp(k);
        else
            disp('not orthogonal - ');
            disp(i);
            disp(k);
        end
    end
end

% comparing inverse A and A'
disp('invA :')
disp(inv(A))
disp('A:')
disp(A')

disp('invA == A''')
disp(inv(A) == A')