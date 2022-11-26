function [S,V,M] = stat_check(teams)
load("scores.mat","scores")
for n = 1:numel(teams)
    S(n,1) = std(scores(n,:));
    V(n,1) = var(scores(n,:));
    M(n,1) = mean(scores(n,:));
end
end