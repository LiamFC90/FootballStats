function [S,V,M] = get_stats(~)
load("scores.mat","scores")
load("teams.mat","teams")
for n = 1:numel(teams)
    S(n,1) = std(scores(n,:));
    V(n,1) = var(scores(n,:));
    M(n,1) = mean(scores(n,:));
end
end