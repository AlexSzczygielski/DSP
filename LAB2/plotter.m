function  [X] = plotter(t,X,grid_title)
% inputs:
% X - matrix containing calculated signals 
% rows of X - row 1 is x1, row  is x2, etc.
% columns of X should be passed as calcualted values for each signal,
% accordingly ( to row)
% size(X,1) - determines how many plots are needed
% figure - number of window - first, second , etc. (as an integer), so that
% global var isnt needed
%
% t - calculated time
% using global figure_number to manage number of figure windows
%
% grid_title - to be passed as string with the title of the entire figure,
% if not required pass empty ""

%
global figure_number
figure_number = figure_number+1;
%

figure(figure_number)
for i = 1:size(X,1);
    %set correct number of subplots
    if(size(X,1)>4)
        subplot(3,3,i)
    elseif(size(X,1) == 2)
        subplot(2,1,i)
    elseif(size(X,1) == 1)
        % empty - no subplots
    else
        subplot(2,2,i)
    end
    
    %plot row i and concatenate title
    plot(t,X(i,:),"o-"); grid; title("Signal x(t)"); xlabel("time [s]"); ylabel("Amplitude");
    title(sprintf("x%d", i));
    hold on;
end

%setting the main title of the entire figure
sgtitle(grid_title);
end

