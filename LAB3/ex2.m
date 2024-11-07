clearvars; clc; close all;

A = [[ 1  1  1  1  1  1  1  1]
    [ 1 -1  1 -1  1 -1  1 -1]
    [ 1  1 -1 -1  1  1 -1 -1]
    [ 1 -1 -1  1  1 -1 -1  1]
    [ 1  1  1  1 -1 -1 -1 -1]
    [ 1 -1  1 -1 -1  1 -1  1]
    [ 1  1 -1 -1 -1 -1  1  1]
    [ 1 -1 -1  1 -1  1  1 -1]];
A = A/ sqrt(8);

%check normalization of each vector (1 means normalized):

check = [sum(dot(A(1,:), A(1,:))), sum(dot(A(2,:), A(2,:))), sum(dot(A(3,:), A(3,:))), sum(dot(A(4,:), A(4,:))),sum(dot(A(5,:), ...
    A(5,:))),sum(dot(A(6,:), A(6,:))),sum(dot(A(7,:), A(7,:))),sum(dot(A(8,:), A(8,:)))];


%check orthogonality
for i = 1:8
    for k = i+1:8
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

disp('display normalization vector')
disp(check)

% comparing inverse A and A'
disp('invA :')
disp(inv(A))
disp('A:')
disp(A')

disp('invA == A''')
disp(inv(A) == A')

