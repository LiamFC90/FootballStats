clearvars
clc
close all

load teams.mat teams
week = 3; %update to current week%

%%%% Call  get_points(teams,week) each week to enter new points into scores array.

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
    bar(xspace,M,.4)
    hold on
    ylabel('Mean points')
    yyaxis right
    bar(xspace+.1,S,.2)
    ylabel('Std')
    legend('Mean', 'Std',Location='bestoutside')
    title(strcat('Javale4prez Week ',string(week),' Stats'))
    xticks([1 2 3 4 5 6 7 8 9 10 11 12])
    xticklabels(teams)
    grid on
    exportgraphics(gcf,strcat(string(week),'.png'),"Resolution",150)    
end