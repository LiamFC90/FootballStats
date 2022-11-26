clearvars
clc
close all

load teams.mat teams
week = 11; %update to current week%

%%%% Call  get_points(teams,week) each week to enter new points into scores array.
%get_points(teams,week)
get_points(teams,week)
plot_it(teams, week)

function [] = get_points(teams, week)
load("scores.mat","scores");    
for n = 1:numel(teams)
    inputscore = input(strcat(string(teams(n)),' scored how many points in week_',string(week),'\n'));
    scores(n,week) = inputscore;
    fprintf('\n\n')
end    
save("scores.mat","scores")
end

function [S,V,M] = get_stats(teams)
load("scores.mat","scores")
for n = 1:numel(teams)
    S(n,1) = std(scores(n,:));
    V(n,1) = var(scores(n,:));
    M(n,1) = mean(scores(n,:));
end
end

function [] = plot_it(teams, week)
    [S,V,M] = get_stats(teams);
    xspace = [1:1:12];
    bar(xspace,M,.4,'blue')
    hold on
    ylabel('Mean points')


    S1 = M - S; 
    S2 = M + S;


    bar(xspace+.1,S2,.2,'red')
        LM = zeros(1,12) + mean(M);
    plot(xspace,LM,"LineWidth",2,"Color",'g')
    bar(xspace+.1,S1,.2,'blue')

    title(strcat('Javale4prez Week ',string(week),' Stats'))
    xticks([1 2 3 4 5 6 7 8 9 10 11 12])
    xticklabels(teams)
    grid on
   
    hold on
    
    plot(xspace,LM,"LineWidth",2,"Color",'g')
    legend('Mean', 'Std',strcat('LeagueAvg=',string(mean(M))),Location='best')
    exportgraphics(gcf,strcat(string(week),'.png'),"Resolution",150)    
end